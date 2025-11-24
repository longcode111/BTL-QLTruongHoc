USE QL_TruongHoc;
GO

-- Xóa bảng cũ nếu cần chạy lại
IF OBJECT_ID('Diem') IS NOT NULL DROP TABLE Diem;
IF OBJECT_ID('HocSinh') IS NOT NULL DROP TABLE HocSinh;
IF OBJECT_ID('LopHoc') IS NOT NULL DROP TABLE LopHoc;
IF OBJECT_ID('GiaoVien') IS NOT NULL DROP TABLE GiaoVien;
IF OBJECT_ID('MonHoc') IS NOT NULL DROP TABLE MonHoc;
GO

-- Tạo lại 5 bảng chuẩn
CREATE TABLE MonHoc (
    MaMH char(6) PRIMARY KEY,
    TenMH nvarchar(50) NOT NULL
);

CREATE TABLE GiaoVien (
    MaGV char(8) PRIMARY KEY,
    TenGV nvarchar(50) NOT NULL,
    MonHoc nvarchar(50),
    Email varchar(100)
);

CREATE TABLE LopHoc (
    MaLop char(6) PRIMARY KEY,
    TenLop nvarchar(20) NOT NULL,
    GiaoVienCN char(8) REFERENCES GiaoVien(MaGV)
);

CREATE TABLE HocSinh (
    MaHS char(8) PRIMARY KEY,
    TenHS nvarchar(50) NOT NULL,
    NgaySinh date,
    LopHoc nvarchar(20),
    DiaChi nvarchar(100)
);

CREATE TABLE Diem (
    MaDiem int IDENTITY(1,1) PRIMARY KEY,
    MaHS char(8) REFERENCES HocSinh(MaHS),
    MaMH char(6) REFERENCES MonHoc(MaMH),
    Diem float CHECK (Diem >= 0 AND Diem <= 10)
);