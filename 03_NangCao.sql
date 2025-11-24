USE QL_TruongHoc;
GO

--------------------------------------------------------------------
-- 5.1 INDEX
--------------------------------------------------------------------
CREATE NONCLUSTERED INDEX IX_HocSinh_LopHoc ON HocSinh(LopHoc);
CREATE NONCLUSTERED INDEX IX_Diem_MaHS    ON Diem(MaHS);
CREATE NONCLUSTERED INDEX IX_Diem_MaMH    ON Diem(MaMH);
GO

--------------------------------------------------------------------
-- 5.2 VIEW
--------------------------------------------------------------------
CREATE OR ALTER VIEW vw_HocSinh_DiemTB AS
SELECT 
    hs.MaHS,
    hs.TenHS,
    hs.LopHoc,
    ISNULL(ROUND(AVG(d.Diem), 2), 0) AS DiemTB,
    COUNT(d.MaMH) AS SoMonHoc
FROM HocSinh hs
LEFT JOIN Diem d ON hs.MaHS = d.MaHS
GROUP BY hs.MaHS, hs.TenHS, hs.LopHoc;
GO

--------------------------------------------------------------------
-- 5.3 PROCEDURE
--------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_ThemHocSinh
    @MaHS     char(8),
    @TenHS    nvarchar(50),
    @NgaySinh date,
    @LopHoc   nvarchar(20),
    @DiaChi   nvarchar(100)
AS
BEGIN
    INSERT INTO HocSinh (MaHS, TenHS, NgaySinh, LopHoc, DiaChi)
    VALUES (@MaHS, @TenHS, @NgaySinh, @LopHoc, @DiaChi);
END
GO

--------------------------------------------------------------------
-- 5.5 TRIGGER + BẢNG LOG
--------------------------------------------------------------------
IF OBJECT_ID('LogXoaDiem') IS NULL
CREATE TABLE LogXoaDiem (
    LogID    int IDENTITY(1,1) PRIMARY KEY,
    MaDiem   int,
    MaHS     char(8),
    MaMH     char(6),
    DiemCu   float,
    NgayXoa  datetime DEFAULT GETDATE()
);
GO

CREATE OR ALTER TRIGGER trg_XoaDiem ON Diem
AFTER DELETE
AS
BEGIN
    INSERT INTO LogXoaDiem (MaDiem, MaHS, MaMH, DiemCu)
    SELECT MaDiem, MaHS, MaMH, Diem FROM deleted;
END
GO

PRINT 'HOÀN THÀNH 100% PHẦN NÂNG CAO – CHÚC BẠN 10 ĐIỂM!';