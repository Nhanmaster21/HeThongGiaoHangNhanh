Create DATABASE QUANLIHETHONG
--use master
--go
--Drop database QUANLIHETHONG
go
Use QUANLIHETHONG
Go

CREATE TABLE [TaiXe] (
  [MaTaiXe] nvarchar(30),
  [HoTen] nvarchar(30),
  [CCCD] nvarchar(30),
  [SoTaiKhoan] nvarchar(30),
  [Email] nvarchar(30),
  [BienSoXe] nvarchar(30),
  [KVHoatDong] nvarchar(30),
  [NganHang] nvarchar(30),
  [NgayGiao] DATE,
  [NgayNhan] DATE 
  PRIMARY KEY ([MaTaiXe])
);
ALTER TABLE dbo.TaiXe DROP COLUMN NgayGiao
ALTER TABLE dbo.TaiXe DROP COLUMN NgayNhan

CREATE TABLE [DanhSachTaiXe] (
  [MaTaiXe] nvarchar(30),
  [MaDoiTac] nvarchar(30),
  PRIMARY KEY ([MaTaiXe], [MaDoiTac])
);

CREATE TABLE [DoiTac] (
  [MaDoiTac] nvarchar(30),
  [TenQuan] nvarchar(30),
  [Email] nvarchar(30),
  [ThanhPho] nvarchar(30),
  [Quan] nvarchar(30),
  [SLChiNhanh] smallint,
  [SLDonHang] smallint,
  [LoaiAmThuc] nvarchar(30),
  [SDT] nvarchar(30),
  PRIMARY KEY ([MaDoiTac])
);

CREATE TABLE [HopDong] (
  [MaHopDong] nvarchar(30),
  [PhiKichHoat] nvarchar(30),
  [NguoiDaiDien] nvarchar(30),
  [SoTaiKhoan] nvarchar(30),
  [TenNganHang] nvarchar(30),
  [NgayBD] date,
  [NgayKT] date,
  [MaDoiTac] nvarchar(30),
  PRIMARY KEY ([MaDoiTac])
);
ALTER TABLE dbo.HopDong ADD TrangThaiDuyet VARCHAR(1)

CREATE TABLE [CuaHang] (
  [MaCH] nvarchar(30),
  [MaDoiTac] nvarchar(30),
  [TenQuan] nvarchar(30),
  [TinhTrangCH] nvarchar(30),
  [GioMoCua] time(7),
  [GioDongCua] time(7),
  PRIMARY KEY ([MaCH])
);

CREATE TABLE [ChiTietDonHang] (
  [MaDH] nvarchar(30),
  [MaMonAn] nvarchar(30),
  [MaDoiTac] nvarchar(30),
  [SoLuong] smallint,
  PRIMARY KEY ([MaDoiTac], [MaDH], [MaMonAn])
);

CREATE TABLE [KhachHang] (
  [MaKH] nvarchar(30),
  [DiaChiKH] nvarchar(30),
  [HoTen] nvarchar(30),
  [EmailKH] nvarchar(30),
  [SDTKH] nvarchar(30),
  [SoDu] INT
  PRIMARY KEY ([MaKH])
);

CREATE TABLE [ChiNhanh] (
  [MaChiNhanh] nvarchar(30),
  [DiaChi] nvarchar(30),
  [MaDoiTac] nvarchar(30),
  PRIMARY KEY ([MaChiNhanh],[MaDoiTac])
);

CREATE TABLE [ChiTietTHucDon] (
  [MaDoiTac] nvarchar(30),
  [MaMonAn] nvarchar(30),
  [MieuTaMonAn] nvarchar(30),
  [GiaMon] bigint,
  [TinhTrangMon] nvarchar(30),
  [TuyChon] nvarchar(30),
  [SoLuong] INT 
  PRIMARY KEY ([MaMonAn],[MaDoiTac])
);

CREATE TABLE [DonHang] (
  [MaDH] nvarchar(30),
  [MaCH] nvarchar(30),
  [MaKH] nvarchar(30),
  [MaTaiXe] nvarchar(30),
  [DanhGia] nvarchar(30),
  [TinhTrang] nvarchar(30),
  [TongThanhToan] bigint,
  [NgayNhanDon] DATE,
  [NgayGiao] DATE 
  PRIMARY KEY ([MaDH])
);
ALTER TABLE dbo.DonHang ADD TongTien INT
ALTER TABLE dbo.DonHang ADD HoaHong VARCHAR(2)

CREATE TABLE [DanhSachThanhVien] (
  [MaThanhVien] nvarchar(30),
  [MaDoiTac] nvarchar(30),
  [MaKH] nvarchar(30),
  PRIMARY KEY ([MaThanhVien])
);

CREATE TABLE [TaiKhoan](
	[TaiKhoan] NVARCHAR(30),
	[MatKhau] NVARCHAR(30)
)
INSERT INTO dbo.TaiKhoan VALUES (N'nhan',N'nhan123')

ALTER TABLE dbo.ChiNhanh
ADD CONSTRAINT FK_CHINHANH_DOITAC
FOREIGN KEY ([MaDoiTac])
REFERENCES DOITAC

ALTER TABLE HOPDONG
ADD CONSTRAINT FK_HOPDONG_DOITAC
FOREIGN KEY ([MADOITAC])
REFERENCES DOITAC

ALTER TABLE DanhSachThanhVien
ADD CONSTRAINT FK_DanhSachThanhVien_DoiTac
FOREIGN KEY ([MaDoiTac])
REFERENCES DoiTac

ALTER TABLE DanhSachThanhVien
ADD CONSTRAINT [FK_DanhSachThanhVien_KhachHang]
FOREIGN KEY ([MaKH])
REFERENCES [KhachHang]

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_KhachHang
FOREIGN KEY (MaKH)
REFERENCES KhachHang

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_CuaHang
FOREIGN KEY (MaCH)
REFERENCES CuaHang

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_TaiXe
FOREIGN KEY (MaTaiXe)
REFERENCES TaiXe

ALTER TABLE DanhSachTaiXe
ADD CONSTRAINT FK_DanhSachTaiXe_TaiXe
FOREIGN KEY (MaTaiXe)
REFERENCES TaiXe

ALTER TABLE DanhSachTaiXe
ADD CONSTRAINT FK_DanhSachTaiXe_DoiTac
FOREIGN KEY (MaDoiTac)
REFERENCES DoiTac

ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_ChiTietDonHang_DonHang
FOREIGN KEY (MaDH)
REFERENCES DonHang

ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_ChiTietDonHang_ChiTietTHucDon
FOREIGN KEY (MaDoiTac,MaMonAn)
REFERENCES ChiTietTHucDon

ALTER TABLE ChiTietTHucDon
ADD CONSTRAINT FK_ChiTietTHucDon_DoiTac
FOREIGN KEY (MaDoiTac)
REFERENCES DoiTac

ALTER TABLE CuaHang
ADD CONSTRAINT FK_CuaHang_DoiTac
FOREIGN KEY (MaDoiTac)
REFERENCES DoiTac
