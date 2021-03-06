USE [ExerciseSQL]
GO
DROP PROCEDURE [dbo].[thu_tuc_luu_tru_ThongKe]
GO
DROP PROCEDURE [dbo].[thu_tuc_luu_tru_MatHang2]
GO
DROP PROCEDURE [dbo].[thu_tuc_luu_tru_MatHang]
GO
DROP PROCEDURE [dbo].[thu_tuc_luu_tru_InsertMatHang]
GO
ALTER TABLE [dbo].[mathang] DROP CONSTRAINT [fk_mathang_nhacungcap]
GO
ALTER TABLE [dbo].[mathang] DROP CONSTRAINT [fk_mathang_loaihang]
GO
ALTER TABLE [dbo].[dondathang] DROP CONSTRAINT [fk_dondathang_nhanvien]
GO
ALTER TABLE [dbo].[dondathang] DROP CONSTRAINT [fk_dondathang_khachhang]
GO
ALTER TABLE [dbo].[chitietdathang] DROP CONSTRAINT [fk_chitiet_mathang]
GO
ALTER TABLE [dbo].[chitietdathang] DROP CONSTRAINT [fk_chitiet_dondathang]
GO
DROP TABLE [dbo].[nhanvien]
GO
DROP TABLE [dbo].[nhacungcap]
GO
DROP TABLE [dbo].[mathang]
GO
DROP TABLE [dbo].[loaihang]
GO
DROP TABLE [dbo].[khachhang]
GO
DROP TABLE [dbo].[dondathang]
GO
DROP TABLE [dbo].[chitietdathang]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdathang](
	[sohoadon] [int] NOT NULL,
	[mahang] [nvarchar](10) NOT NULL,
	[giaban] [money] NOT NULL,
	[soluong] [smallint] NOT NULL,
	[mucgiamgia] [real] NOT NULL,
 CONSTRAINT [pk_chitietdathang] PRIMARY KEY CLUSTERED 
(
	[sohoadon] ASC,
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dondathang](
	[sohoadon] [int] NOT NULL,
	[makhachhang] [nvarchar](10) NULL,
	[manhanvien] [nvarchar](10) NULL,
	[ngaydathang] [smalldatetime] NULL,
	[ngaygiaohang] [smalldatetime] NULL,
	[ngaychuyenhang] [smalldatetime] NULL,
	[noigiaohang] [nvarchar](50) NULL,
 CONSTRAINT [pk_dondathang] PRIMARY KEY CLUSTERED 
(
	[sohoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makhachhang] [nvarchar](10) NOT NULL,
	[tencongty] [nvarchar](50) NOT NULL,
	[tengiaodich] [nvarchar](30) NOT NULL,
	[diachi] [nvarchar](50) NULL,
	[email] [nvarchar](30) NULL,
	[dienthoai] [nvarchar](15) NULL,
	[fax] [nvarchar](15) NULL,
 CONSTRAINT [pk_khachhang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaihang](
	[maloaihang] [int] NOT NULL,
	[tenloaihang] [nvarchar](15) NOT NULL,
 CONSTRAINT [pk_loaihang] PRIMARY KEY CLUSTERED 
(
	[maloaihang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mathang](
	[mahang] [nvarchar](10) NOT NULL,
	[tenhang] [nvarchar](50) NOT NULL,
	[macongty] [nvarchar](10) NULL,
	[maloaihang] [int] NULL,
	[soluong] [int] NULL,
	[donvitinh] [nvarchar](20) NULL,
	[giahang] [money] NULL,
 CONSTRAINT [pk_mathang] PRIMARY KEY CLUSTERED 
(
	[mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[macongty] [nvarchar](10) NOT NULL,
	[tencongty] [nvarchar](40) NOT NULL,
	[tengiaodich] [nvarchar](30) NULL,
	[diachi] [nvarchar](60) NULL,
	[dienthoai] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [pk_nhacungcap] PRIMARY KEY CLUSTERED 
(
	[macongty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manhanvien] [nvarchar](10) NOT NULL,
	[ho] [nvarchar](20) NOT NULL,
	[ten] [nvarchar](10) NOT NULL,
	[ngaysinh] [datetime] NULL,
	[ngaylamviec] [datetime] NULL,
	[diachi] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](15) NULL,
	[luongcoban] [money] NULL,
	[phucap] [money] NULL,
 CONSTRAINT [pk_nhanvien] PRIMARY KEY CLUSTERED 
(
	[manhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (1, N'a2', 100.0000, 100, 10)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (2, N'a1', 110.0000, 10, 10)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (3, N'a2', 210.0000, 210, 21)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (20, N'a1', 200.0000, 102, 10)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (30, N'a2', 220.0000, 20, 20)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (30, N'a3', 300.0000, 300, 30)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (40, N'a3', 340.0000, 240, 34)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (40, N'a4', 400.0000, 40, 40)
INSERT [dbo].[chitietdathang] ([sohoadon], [mahang], [giaban], [soluong], [mucgiamgia]) VALUES (50, N'a4', 500.0000, 500, 50)
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (1, N'adf125', N'abc125', CAST(N'2003-02-02 00:00:00' AS SmallDateTime), CAST(N'2003-02-03 00:00:00' AS SmallDateTime), CAST(N'2003-02-04 00:00:00' AS SmallDateTime), N'Sai Gon')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (2, N'adf127', N'abc124', CAST(N'2003-02-03 00:00:00' AS SmallDateTime), CAST(N'2003-02-04 00:00:00' AS SmallDateTime), CAST(N'2003-02-05 00:00:00' AS SmallDateTime), N'Ha Noi')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (3, N'adf127', N'abc125', CAST(N'2003-03-01 00:00:00' AS SmallDateTime), CAST(N'2003-03-02 00:00:00' AS SmallDateTime), CAST(N'2003-03-03 00:00:00' AS SmallDateTime), N'Da Nang')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (4, N'adf125', N'abc124', CAST(N'2003-04-01 00:00:00' AS SmallDateTime), CAST(N'2003-04-01 00:00:00' AS SmallDateTime), CAST(N'2003-04-01 00:00:00' AS SmallDateTime), N'ha noi - viet nam')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (20, N'adf125', N'abc123', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), CAST(N'2003-01-03 00:00:00' AS SmallDateTime), CAST(N'2003-01-05 00:00:00' AS SmallDateTime), N'Tuyen Quang')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (30, N'adf126', N'abc123', CAST(N'2003-01-01 00:00:00' AS SmallDateTime), CAST(N'2003-01-03 00:00:00' AS SmallDateTime), CAST(N'2003-01-05 00:00:00' AS SmallDateTime), N'phan lan')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (40, N'adf126', N'abc125', CAST(N'2003-08-09 00:00:00' AS SmallDateTime), CAST(N'2003-08-10 00:00:00' AS SmallDateTime), CAST(N'2003-09-11 00:00:00' AS SmallDateTime), N'US')
INSERT [dbo].[dondathang] ([sohoadon], [makhachhang], [manhanvien], [ngaydathang], [ngaygiaohang], [ngaychuyenhang], [noigiaohang]) VALUES (50, N'adf126', N'abc124', CAST(N'2009-09-09 00:00:00' AS SmallDateTime), CAST(N'2009-09-10 00:00:00' AS SmallDateTime), CAST(N'2009-09-11 00:00:00' AS SmallDateTime), N'UK')
INSERT [dbo].[khachhang] ([makhachhang], [tencongty], [tengiaodich], [diachi], [email], [dienthoai], [fax]) VALUES (N'adf125', N'toshiba', N'chuyen tien', N'TP.Ha Noi', N'444@gmail.com', N'0444444444', N'0444444444')
INSERT [dbo].[khachhang] ([makhachhang], [tencongty], [tengiaodich], [diachi], [email], [dienthoai], [fax]) VALUES (N'adf126', N'nokia', N'chuyen dien thoai', N'Sai Gon', N'hienu@gmail.com', N'09634879612', N'009841912')
INSERT [dbo].[khachhang] ([makhachhang], [tencongty], [tengiaodich], [diachi], [email], [dienthoai], [fax]) VALUES (N'adf127', N'vin', N'chuyen do an', NULL, NULL, NULL, NULL)
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (111, N'dien thoai')
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (112, N'vi vi')
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (113, N'dieu hoa')
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (114, N'tu lanh')
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (115, N'may giat')
INSERT [dbo].[loaihang] ([maloaihang], [tenloaihang]) VALUES (116, N'xe may')
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a1', N'iphone 7', N'mobi877', 111, 1000, N'do la', 200.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a2', N'iphone 8', N'vng876', 112, 3000, N'do la', 300.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a3', N'iphone X', N'vng876', 113, 3500, N'do la', 350.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a4', N'iphone 11', N'vng876', 114, 1100, N'do la', 110.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a5', N'iphone 11', N'mobi877', 114, 1000, N'do la', 110.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a6', N'honda cbr600', N'mobi877', 115, 2000, N'do la', 600.0000)
INSERT [dbo].[mathang] ([mahang], [tenhang], [macongty], [maloaihang], [soluong], [donvitinh], [giahang]) VALUES (N'a7', N'may giat tosiba', N'vng876', 116, 3000, N'do la', 200.0000)
INSERT [dbo].[nhacungcap] ([macongty], [tencongty], [tengiaodich], [diachi], [dienthoai], [fax], [email]) VALUES (N'mobi877', N'mobi877', N'chuyen tien', N'TP.Ha Noi', N'07298342487', N'01898023434', N'mobiphone@gmail.com')
INSERT [dbo].[nhacungcap] ([macongty], [tencongty], [tengiaodich], [diachi], [dienthoai], [fax], [email]) VALUES (N'vng444', N'toshiba', N'chuyen tien', N'TP.Ha Noi', N'0444444444', N'0444444444', N'444@gmail.com')
INSERT [dbo].[nhacungcap] ([macongty], [tencongty], [tengiaodich], [diachi], [dienthoai], [fax], [email]) VALUES (N'vng876', N'Vinagame', N'giao dich game', N'TP.HCM', N'09874152487', N'01254789642', N'vng@gmail.com')
INSERT [dbo].[nhacungcap] ([macongty], [tencongty], [tengiaodich], [diachi], [dienthoai], [fax], [email]) VALUES (N'vng877', N'vinaphone', N'chuyen dien thoai', N'TP.Ha Noi', N'032093452487', N'019834642', N'vinaphone@gmail.com')
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'abc123', N'Hazard', N'Eden', CAST(N'1991-01-07 00:00:00.000' AS DateTime), CAST(N'2008-11-11 00:00:00.000' AS DateTime), N'Belgian', N'0985214785', 150.0000, 75.0000)
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'abc124', N'Griezmann', N'Antoine', CAST(N'1991-03-21 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), N'France', N'03256987415', 100.0000, 50.0000)
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'abc125', N'Pogba', N'Paul', CAST(N'1993-05-15 00:00:00.000' AS DateTime), CAST(N'2008-01-01 00:00:00.000' AS DateTime), N'France', N'03415785241', 112.5000, 75.0000)
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'abc126', N'Griezmann', N'Antoine', CAST(N'1991-03-21 00:00:00.000' AS DateTime), CAST(N'2008-02-02 00:00:00.000' AS DateTime), N'France', N'03256987415', 75.0000, 20.0000)
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'abc484', N'Lukaku', N'Romelu', CAST(N'1993-05-13 00:00:00.000' AS DateTime), CAST(N'2008-09-09 00:00:00.000' AS DateTime), N'Belgian', N'0999988547', 75.0000, 20.0000)
INSERT [dbo].[nhanvien] ([manhanvien], [ho], [ten], [ngaysinh], [ngaylamviec], [diachi], [dienthoai], [luongcoban], [phucap]) VALUES (N'adj418', N'Coutinho', N'Philippe ', CAST(N'1992-01-12 00:00:00.000' AS DateTime), CAST(N'2008-07-11 00:00:00.000' AS DateTime), N' Brazil', N'010787745178', 75.0000, 20.0000)
ALTER TABLE [dbo].[chitietdathang]  WITH CHECK ADD  CONSTRAINT [fk_chitiet_dondathang] FOREIGN KEY([sohoadon])
REFERENCES [dbo].[dondathang] ([sohoadon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitietdathang] CHECK CONSTRAINT [fk_chitiet_dondathang]
GO
ALTER TABLE [dbo].[chitietdathang]  WITH CHECK ADD  CONSTRAINT [fk_chitiet_mathang] FOREIGN KEY([mahang])
REFERENCES [dbo].[mathang] ([mahang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitietdathang] CHECK CONSTRAINT [fk_chitiet_mathang]
GO
ALTER TABLE [dbo].[dondathang]  WITH CHECK ADD  CONSTRAINT [fk_dondathang_khachhang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[khachhang] ([makhachhang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dondathang] CHECK CONSTRAINT [fk_dondathang_khachhang]
GO
ALTER TABLE [dbo].[dondathang]  WITH CHECK ADD  CONSTRAINT [fk_dondathang_nhanvien] FOREIGN KEY([manhanvien])
REFERENCES [dbo].[nhanvien] ([manhanvien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dondathang] CHECK CONSTRAINT [fk_dondathang_nhanvien]
GO
ALTER TABLE [dbo].[mathang]  WITH CHECK ADD  CONSTRAINT [fk_mathang_loaihang] FOREIGN KEY([maloaihang])
REFERENCES [dbo].[loaihang] ([maloaihang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[mathang] CHECK CONSTRAINT [fk_mathang_loaihang]
GO
ALTER TABLE [dbo].[mathang]  WITH CHECK ADD  CONSTRAINT [fk_mathang_nhacungcap] FOREIGN KEY([macongty])
REFERENCES [dbo].[nhacungcap] ([macongty])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[mathang] CHECK CONSTRAINT [fk_mathang_nhacungcap]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thu_tuc_luu_tru_InsertMatHang](
		@mahang nvarchar(10)
      , @tenhang nvarchar(50)
      , @macongty nvarchar(10)
      , @maloaihang int
      , @soluong int
      , @donvitinh nvarchar(20)
      , @giahang money)
	  AS
	  BEGIN
			DECLARE @ma_Hang INT
			SELECT @ma_Hang = COUNT(*) FROM mathang WHERE mahang = @mahang
				IF(@ma_Hang = 0)
					BEGIN
						DECLARE @ma_Cty INT
						SELECT @ma_Cty = COUNT(*) FROM nhacungcap WHERE macongty = @macongty
						IF(@ma_Cty = 0)
							BEGIN
								DECLARE @ma_Loai INT
								SELECT @ma_Loai = COUNT(*) FROM loaihang WHERE maloaihang = @maloaihang
								IF(@ma_Loai = 0)
									BEGIN
										IF(@soluong >= 0)
											BEGIN
												INSERT INTO mathang 
												VALUES(@mahang, @tenhang, @macongty, @maloaihang, @soluong, @donvitinh, @giahang)
											END
										ELSE
										  PRINT 'SỐ LƯỢNG PHẢI LỚN HƠN 0'
									END
								ELSE
									PRINT 'MÃ LOẠI HÀNG CHƯA TỒN TẠI'	
						
							END
						ELSE
						   PRINT 'MÃ CÔNG TY CHƯA TỒN TẠI'	
				
					END
				ELSE
					PRINT 'MÃ HÀNG BỊ TRÙNG'
	  INSERT INTO mathang
	  VALUES (@mahang, @tenhang, @macongty, @maloaihang, @soluong, @donvitinh, @giahang)
	  END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thu_tuc_luu_tru_MatHang](@mahang nvarchar(10)
      , @tenhang nvarchar(50)
      , @macongty nvarchar(10)
      , @maloaihang int
      , @soluong int
      , @donvitinh nvarchar(20)
      , @giahang money)
	  AS
	  BEGIN
	  INSERT INTO mathang
	  VALUES (@mahang, @tenhang, @macongty, @maloaihang, @soluong, @donvitinh, @giahang)
	  END
    
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thu_tuc_luu_tru_MatHang2](@mahang nvarchar(10)
      , @tenhang nvarchar(50)
      , @macongty nvarchar(10)
      , @maloaihang int
      , @soluong int
      , @donvitinh nvarchar(20)
      , @giahang money)
	  AS
	  BEGIN
	  INSERT INTO mathang
	  VALUES (@mahang, @tenhang, @macongty, @maloaihang, @soluong, @donvitinh, @giahang)
	  END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[thu_tuc_luu_tru_ThongKe](@mahang nvarchar(10))
	  AS
	  BEGIN
		select mahang, sum(soluong) as TongSoLuongBan from(
		select chitietdathang.sohoadon, chitietdathang.mahang, chitietdathang.soluong, dondathang.ngaydathang
		from chitietdathang
		inner join dondathang on dondathang.sohoadon = chitietdathang.sohoadon
		) as bangtam group by mahang
	  END
GO
