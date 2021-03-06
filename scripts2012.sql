USE [master]
GO
/****** Object:  Database [mystore]    Script Date: 5/20/2022 4:34:30 PM ******/
CREATE DATABASE [mystore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mystore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mystore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mystore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mystore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mystore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mystore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mystore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mystore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mystore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mystore] SET ARITHABORT OFF 
GO
ALTER DATABASE [mystore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mystore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mystore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mystore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mystore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mystore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mystore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mystore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mystore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mystore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mystore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mystore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mystore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mystore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mystore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mystore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mystore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mystore] SET RECOVERY FULL 
GO
ALTER DATABASE [mystore] SET  MULTI_USER 
GO
ALTER DATABASE [mystore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mystore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mystore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mystore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mystore', N'ON'
GO
USE [mystore]
GO
/****** Object:  Table [dbo].[chi_tiet_hoa_don]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_hoa_don](
	[hoaDonId] [int] NOT NULL,
	[sanPhamId] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hoaDonId] ASC,
	[sanPhamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[hoaDonId] [int] IDENTITY(1,1) NOT NULL,
	[ngayMua] [datetime2](7) NULL,
	[nguoiDungId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hoaDonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[diaChi] [nvarchar](255) NULL,
	[hoTenDem] [nvarchar](255) NULL,
	[soDienThoai] [nvarchar](255) NULL,
	[ten] [nvarchar](255) NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[sanPhamId] [int] IDENTITY(1,1) NOT NULL,
	[donGia] [float] NOT NULL,
	[hinhAnh] [nvarchar](255) NULL,
	[loaiSanPham] [int] NULL,
	[moTa] [nvarchar](255) NULL,
	[soLuong] [int] NOT NULL,
	[tenSanPham] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[sanPhamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_table]    Script Date: 5/20/2022 4:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 

INSERT [dbo].[hoa_don] ([hoaDonId], [ngayMua], [nguoiDungId]) VALUES (1, CAST(N'2022-05-11T09:43:00.6150000' AS DateTime2), 7)
INSERT [dbo].[hoa_don] ([hoaDonId], [ngayMua], [nguoiDungId]) VALUES (2, CAST(N'2022-05-20T15:17:56.4290000' AS DateTime2), 7)
INSERT [dbo].[hoa_don] ([hoaDonId], [ngayMua], [nguoiDungId]) VALUES (3, CAST(N'2022-05-20T16:04:13.3730000' AS DateTime2), 2)
INSERT [dbo].[hoa_don] ([hoaDonId], [ngayMua], [nguoiDungId]) VALUES (4, CAST(N'2022-05-20T16:26:16.7180000' AS DateTime2), 9)
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoi_dung] ON 

INSERT [dbo].[nguoi_dung] ([id], [diaChi], [hoTenDem], [soDienThoai], [ten], [user_id]) VALUES (2, N'12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM', N'Nguyen Thi Quynh', N'0999999999', N'Mai', 2)
INSERT [dbo].[nguoi_dung] ([id], [diaChi], [hoTenDem], [soDienThoai], [ten], [user_id]) VALUES (7, N'12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM', N'Pham Xuan', N'0999999999', N'Vu', 12)
INSERT [dbo].[nguoi_dung] ([id], [diaChi], [hoTenDem], [soDienThoai], [ten], [user_id]) VALUES (8, N'12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM', N'Phạm Xuân', N'0349380770', N'Vũ', 13)
INSERT [dbo].[nguoi_dung] ([id], [diaChi], [hoTenDem], [soDienThoai], [ten], [user_id]) VALUES (9, N'12, Nguyễn Văn Bảo,P4,Gò Vấp,HCM', N'Dương Anh', N'0349380110', N'Tú', 14)
INSERT [dbo].[nguoi_dung] ([id], [diaChi], [hoTenDem], [soDienThoai], [ten], [user_id]) VALUES (10, N'Bến Tre', N'Phạm Thị Thanh', N'0968452156', N'Ngân', 15)
SET IDENTITY_INSERT [dbo].[nguoi_dung] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'ROLE_MEMBER')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 

INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (1, 99000, N'/images/socola1.jpg', 1, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 10, N'Socola đen')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (2, 150000, N'/images/keo2.jpg', 0, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 10, N'Kẹo nhật bản')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (3, 99000, N'/images/keo1.jpg', 0, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 10, N'Kẹo trái cây')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (4, 510000, N'/images/socola2.jpg', 1, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 10, N'Socola Ferrero Rocher Collection')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (6, 20000, N'/images/socola7.jpg', 0, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 10, N'Kẹo Alpenliebe')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (7, 245000, N'/images/keo-1.jpg', 0, N'Nougat mùa xuân được làm từ những nguyên liệu cao cấp với nhiều ý nghĩa may mắn. Hãy cùng khám phá hạt dẻ cười béo ngậy, hương dâu thơm lừng, vị sung mỹ cực ghiền và vị chua nhẹ của nam việt quất trong viên kẹo tuyệt vời này', 2, N'Nougat Spring')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (8, 30000, N'/images/keo6.jpg', 0, N'Playmore là sản phẩm kẹo được giới trẻ cực kỳ yêu thích tại Thailand và quốc tế Hương vị đào thơm mát và ngọt thanh, cảm giác mới lạ đó kết hợp với độ the lạnh tạo sảng khoái ngay lập tức, giúp bạn tỉnh táo và tràn đầy năng lượng.', 10, N'Kẹo the vị đào Sakura Playmore')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (9, 550000, N'/images/socola6.png', 1, N'Quả là 1 món quà socola valentine ý nghĩa độc đáo đúng không nào? Những hộp socola valentine trái tim này bạn chỉ có thể tìm thấy tại MTVShop. Đảm bảo đây là món quà “không đụng hàng” cho mùa valentine năm nay đó.', 10, N'Socola valentine')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (10, 20000, N'/images/socola3.jpg', 1, N'Socola phủ đầy lớp bánh xốp giòn ăn béo, ngậy và đậm vị socola, không quá ngọt rấ hấp dẫn. Kẹo socola nhân bơ đậu phộng Snickers thanh 51g tiện lợi, ngon hơn khi bạn ăn lạnh, kích thích vị giác khi ăn. Socola Snickers là thương hiệu của Mỹ', 2, N'Socola nhân đậu phộng Snickers')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (12, 80000, N'/images/socola4.jpg', 1, N'Mua hẳn xô về ăn là có thật, ai nghiền Socola đừng bỏ qua, mà ai không nghiền ăn thử cũng nghiền luôn. Có 3 vị: socola, dâu, đậu phộng, sữa.Bên ngoài bọc socola, bên trong là bánh xốp hoặc hạnh nhân ăn hợp cực kì luôn. Lớp socola không hề ngọt luôn.', 3, N'Kẹo socola xô 12 vị')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (13, 45000, N'/images/keo7.jpg', 0, N'Với thành phần cacao nguyên chất ăn rất tốt cho sức khỏe, giúp lưu thông máu, ngăn ngừa bệnh Ung Thư, giảm stress, thích hợp người bệnh tiểu đường….Mỗi ngày bạn hãy nên ăn 1 lượng SOCOLA đen để bổ sung dưỡng chất cần thiết cho cơ thể mình nhé', 4, N'Trolli - Sour Brite Crawlers')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (14, 830000, N'/images/socola-1.jpg', 1, N' Có 4 Hương vị khác nhau trong 1 túi lớn : Chocolate sữa, Chocolate sữa hạnh nhân, Chocolate ngọt đặc biệt với hạnh nhân và Chocolate sữa thêm kem với bơ cứng và hạnh nhân', 2, N'Hershey''s Nuggets')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (15, 675000, N'/images/socola-2.jpg', 1, N'  Món quà đẹp và sang trọng cho mùa Christmas và New year  được làm ra bởi hãng Godiva nổi tiếng. Vừa đẹp bên ngoài  vừa ngon bên trong.', 4, N'Godiva Advant Calendar')
INSERT [dbo].[san_pham] ([sanPhamId], [donGia], [hinhAnh], [loaiSanPham], [moTa], [soLuong], [tenSanPham]) VALUES (16, 12000, N'/images/keo8.jpg', 0, N'Kẹo ống hút đem đến cảm giác ngọt ngào ngon miệng pha lẫn  1 chút chua cay thú vị.', 10, N'Pixy Stix 4 Flavors')
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (2, 2)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (12, 1)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (12, 2)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (13, 2)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (14, 2)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (15, 2)
GO
SET IDENTITY_INSERT [dbo].[user_table] ON 

INSERT [dbo].[user_table] ([id], [email], [password]) VALUES (2, N'quynhmai@gmail.com', N'$2a$10$cZgY0.ryDoDW1CnQS4LdOuGieM1sshOONT0XSKjv3n.NSN0jgyqcm')
INSERT [dbo].[user_table] ([id], [email], [password]) VALUES (12, N'admin@gmail.com', N'$2a$10$hdVmK7KeLxrGE7GXkT88NuT2.b651aqurYCSw46zjAdTr.GYfFC7q')
INSERT [dbo].[user_table] ([id], [email], [password]) VALUES (13, N'adsds3@gmail.com', N'$2a$10$RwlRtmA6WX6VTy50FMluaOR7MadY1.MIOLQj7xC.mwYLKsBy.O8L.')
INSERT [dbo].[user_table] ([id], [email], [password]) VALUES (14, N'anhtu@gmail.com', N'$2a$10$92hBF9EIcIyh4Lsxs7g9XOzfIs5QPJWmFtZrZlpBx9cV5joYT58xS')
INSERT [dbo].[user_table] ([id], [email], [password]) VALUES (15, N'thanhngan@gmail.com', N'$2a$10$.InNNg5chqOT2rV2hv18VOGRhPGqVQBh.Qm98HAFSLslwR/rx8flu')
SET IDENTITY_INSERT [dbo].[user_table] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_eamk4l51hm6yqb8xw37i23kb5]    Script Date: 5/20/2022 4:34:30 PM ******/
ALTER TABLE [dbo].[user_table] ADD  CONSTRAINT [UK_eamk4l51hm6yqb8xw37i23kb5] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK16voww4f2j77jglp33ybg9mq6] FOREIGN KEY([sanPhamId])
REFERENCES [dbo].[san_pham] ([sanPhamId])
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don] CHECK CONSTRAINT [FK16voww4f2j77jglp33ybg9mq6]
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK5dcdxt5gx75uv04b8soyaoetg] FOREIGN KEY([hoaDonId])
REFERENCES [dbo].[hoa_don] ([hoaDonId])
GO
ALTER TABLE [dbo].[chi_tiet_hoa_don] CHECK CONSTRAINT [FK5dcdxt5gx75uv04b8soyaoetg]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK6fy831iu599tdm1dlx9y3wj36] FOREIGN KEY([nguoiDungId])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK6fy831iu599tdm1dlx9y3wj36]
GO
ALTER TABLE [dbo].[nguoi_dung]  WITH CHECK ADD  CONSTRAINT [FK409v4t58atleesi6xxj5c91a3] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_table] ([id])
GO
ALTER TABLE [dbo].[nguoi_dung] CHECK CONSTRAINT [FK409v4t58atleesi6xxj5c91a3]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK5cwpllhe458f6j6fb7rmhfyt2] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_table] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK5cwpllhe458f6j6fb7rmhfyt2]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FKa68196081fvovjhkek5m97n3y] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FKa68196081fvovjhkek5m97n3y]
GO
USE [master]
GO
ALTER DATABASE [mystore] SET  READ_WRITE 
GO
