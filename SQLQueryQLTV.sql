create database QLTHUVIEN
go
use QLTHUVIEN
go
create table TaiLieu
(
	MaTaiLieu varchar(10) primary key,
	TenTaiLieu nvarchar(50),
	NamXB int,
	MaTG varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.TacGia(MaTG),
	MaTheLoai varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.TheLoai(MaTheLoai),
	MaNXB varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.NhaXuatBan(MaNXB),
)
go
create table DocGia
(
	MaDG varchar(10) primary key,
	TenDG nvarchar(50),
	NgaySinh datetime,
	GioiTinh nvarchar(5),
	Lop nvarchar(10)
)

go
create table TacGia
(
	MaTG varchar(10) primary key,
	TenTG nvarchar(50),
)
go
create table TheLoai
(
	MaTheLoai varchar(10) primary key,
	TenTheLoai nvarchar(20) default N'Tên thể loại',
)
go
create table NhaXuatBan
(
	MaNXB varchar(10) primary key,
	TenNXB nvarchar(50),
	DiaChi nvarchar(100),
	SDT varchar(10)
)
go
create table NhanVien
(
	MaNV varchar(10) primary key,
	TenNV nvarchar(50),
	NgaySinh datetime,
	GioiTinh nvarchar(5),
	DiaChi nvarchar(100),
	SDT varchar(10)
)
create table PhieuMuon
(
	MaPM varchar(10) primary key,
	MaDG varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.DocGia(MaDG),
	MaNV varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.NhanVien(MaNV),
)
create table CTPhieuMuon
(
	MaPM varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.PhieuMuon(MaPM),
	MaTaiLieu varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.TaiLieu(MaTaiLieu),
	NgayMuon datetime,
	NgayTra datetime,
	TinhTrang nvarchar(50)
)
create table Account
(
	TenAccount varchar(20) primary key,
	MKAccount varchar(10),
	MaNV varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.NhanVien(MaNV)
)

drop table Account
drop table TheLoai
drop table TaiLieu
drop table DocGia
drop table PhieuMuon
drop table CTPhieuMuon
drop table TacGia
drop table NhaXuatBan
drop table NhanVien

select TenTG,TenTaiLieu
from TaiLieu A, TacGia B
where A.MaTG = B.MaTG


select * from TaiLieu where TenTaiLieu like '%P%'

insert into TaiLieu values (N'T6','Toán 6','2005','TH','KD','KD')

update TaiLieu set TenTaiLieu=N'Dế mèn',NamXB=N'2016',MaTG='THU',MaTheLoai='PL',MaNXB='KD' where MaTaiLieu = N'1'

--insert into ACCOUNT values ('15','Nguyễn Hữu Hoàng Hiếu', '123456', 1)
--insert into ACCOUNT values ('1','phamhaingoc1', '123456', 1)
--insert into ACCOUNT values ('2','phamhaingoc2', '123456', 1)
--insert into ACCOUNT values ('3','phamminhhoang', '123456', 1)
--insert into ACCOUNT values ('7','nguyenthanhhai', '123456', 1)
--insert into ACCOUNT values ('999','admin', '', 0)
----
insert into DocGia values ('1',N'Phạm Ngọc Hải','5/5/2001','Nam','C1')
insert into DocGia values ('2',N'Phạm Hải NGọc','6/7/2003','Nam','B5')
insert into DocGia values ('3',N'Phạm Minh Hoang','1/2/2001','Nam','A2')
insert into DocGia values ('7',N'Nguyễn Thanh Hải','11/12/2012',N'Nữ','D3')
insert into DocGia values ('15',N'Hữu Hoàng Hiếu','1/10/2010',N'Nữ','E1')

----
insert into TaiLieu values ('1', N'Lập trình hướng đối tượng',2010, N'KB', N'LT', 'ND')
insert into TaiLieu values ('2', N'Nhập môn lập trình',2011, N'GS', N'TL', 'TT')
insert into TaiLieu values ('3', N'Kỹ Thuật Lập Trình',2001, N'KB', N'GT', 'SG')
insert into TaiLieu values ('4', N'Thiết Kế Phần Mềm',2019, N'GS', N'LT', 'KD')
---
insert into PhieuMuon values ('1','1','1','1/1/2017', '1/2/2017')
insert into PhieuMuon values ('2','2','1','1/2/2017', '1/3/2017')
insert into PhieuMuon values ('3','2','2','1/3/2017', '1/4/2017')

---
insert into PHIEUTRA values ('1','1','2','1/1/2016')
insert into PHIEUTRA values ('2','2','1','1/2/2016')
insert into PHIEUTRA values ('3','2','2','1/3/2016')

---
insert into TheLoai values ('DS',N'Đời sống')
insert into TheLoai values ('TL',N'Tài liệu')
insert into TheLoai values ('GT',N'Giải trí')
insert into TheLoai values ('HH',N'Hài hước')
insert into TheLoai values ('LT',N'Lập trình')
---
insert into TacGia values ('DS',N'Danh Sinh')
insert into TacGia values ('NC',N'Nam Cao')
insert into TacGia values ('TH',N'Tô Hoài')
insert into TacGia values ('GS',N'Giáo Sư')
insert into TacGia values ('KB',N'Không biết')
---
insert into NhaXuatBan values ('KD',N'Kim Đồng','Q3','111')
insert into NhaXuatBan values ('ND',N'Nhân Dân','Q6','222')
insert into NhaXuatBan values ('TT',N'Tuổi Trẻ','Q1','333')
insert into NhaXuatBan values ('SG',N'Sài Gòn','Q1','444')
---
insert into NhanVien values ('NV01',N'Ngọc Trinh','12/13/2021',N'Nữ',N'Q1','0123456789')
insert into NhanVien values ('NV02',N'Vĩnh Hưng','11/3/2021',N'Nam',N'Q10','4444444')
insert into NhanVien values ('NV03',N'Phương Hằng','5/6/2021',N'Nam',N'Q11','7777777')