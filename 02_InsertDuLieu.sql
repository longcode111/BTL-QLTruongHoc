USE QL_TruongHoc;
GO

INSERT INTO MonHoc (MaMH, TenMH) VALUES
('MH01', N'Toán'), ('MH02', N'Văn'), ('MH03', N'Anh'), ('MH04', N'Lý'), ('MH05', N'Hóa');

INSERT INTO GiaoVien (MaGV, TenGV, MonHoc, Email) VALUES
('GV01', N'Nguyễn Văn Nam', N'Toán', 'nam@gv.com'),
('GV02', N'Trần Thị Lan', N'Văn', 'lan@gv.com'),
('GV03', N'Lê Minh Tuấn', N'Anh', 'tuan@gv.com');

INSERT INTO LopHoc (MaLop, TenLop, GiaoVienCN) VALUES
('10A1', '10A1', 'GV02'), ('10A2', '10A2', 'GV01'), ('11A1', '11A1', 'GV03');


INSERT INTO HocSinh (MaHS, TenHS, NgaySinh, LopHoc, DiaChi) VALUES
('HS01001', N'Nguyễn Văn An',    '2008-03-15', '10A1', N'Hà Nội'),
('HS01002', N'Trần Thị Mai',     '2008-06-20', '10A1', N'Hải Phòng'),
('HS01003', N'Lê Văn Hoàng',     '2008-09-10', '10A2', N'Đà Nẵng'),
('HS01004', N'Phạm Minh Đức',    '2007-12-05', '11A1', N'TP.HCM'),
('HS01005', N'Hoàng Thị Ngọc',   '2007-08-18', '11A1', N'Nghệ An'),
('HS01006', N'Vũ Văn Hùng',      '2008-04-25', '10A2', N'Hà Nội');

INSERT INTO Diem (MaHS, MaMH, Diem) VALUES
('HS01001','MH01',8.5),('HS01001','MH02',7.0),('HS01001','MH03',9.0),
('HS01002','MH01',9.0),('HS01002','MH02',8.5),('HS01002','MH03',8.0),
('HS01003','MH01',7.5),('HS01003','MH04',9.5),
('HS01004','MH01',6.5),('HS01004','MH02',9.0),
('HS01005','MH03',10.0),('HS01005','MH01',8.0);