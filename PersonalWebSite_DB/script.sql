USE [master]
GO
/****** Object:  Database [PersonalWebPageDB]    Script Date: 31.07.2019 16:59:14 ******/
CREATE DATABASE [PersonalWebPageDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonalWebPageDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PersonalWebPageDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PersonalWebPageDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PersonalWebPageDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PersonalWebPageDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonalWebPageDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonalWebPageDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonalWebPageDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonalWebPageDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonalWebPageDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonalWebPageDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PersonalWebPageDB] SET  MULTI_USER 
GO
ALTER DATABASE [PersonalWebPageDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonalWebPageDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonalWebPageDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonalWebPageDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PersonalWebPageDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PersonalWebPageDB] SET QUERY_STORE = OFF
GO
USE [PersonalWebPageDB]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[kategoriID] [int] IDENTITY(1,1) NOT NULL,
	[kategori] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[kategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makale]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[makaleID] [int] IDENTITY(1,1) NOT NULL,
	[kategoriID] [int] NULL,
	[makaleDetayID] [int] NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[makaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakaleDetay]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakaleDetay](
	[makaleDetayID] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [nvarchar](200) NULL,
	[icerik] [nvarchar](max) NULL,
	[fotograf] [nvarchar](100) NULL,
	[yayınlanmaTarihi] [date] NULL,
	[goruntulenmeSayisi] [int] NULL,
 CONSTRAINT [PK_MakaleDetay] PRIMARY KEY CLUSTERED 
(
	[makaleDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proje]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proje](
	[projeID] [int] IDENTITY(1,1) NOT NULL,
	[projeBaslik] [nvarchar](100) NULL,
	[projeLink] [nvarchar](500) NULL,
 CONSTRAINT [PK_Proje] PRIMARY KEY CLUSTERED 
(
	[projeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[rolID] [int] NOT NULL,
	[rol] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[rolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uye]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uye](
	[uyeID] [int] IDENTITY(1,1) NOT NULL,
	[uyeDetayBilgiID] [int] NULL,
	[rolID] [int] NULL,
	[adSoyad] [nvarchar](100) NULL,
 CONSTRAINT [PK_Uye] PRIMARY KEY CLUSTERED 
(
	[uyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UyeDetay]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UyeDetay](
	[uyeDetayBilgiID] [int] IDENTITY(1,1) NOT NULL,
	[eMail] [nvarchar](200) NULL,
	[kullaniciAdi] [nvarchar](50) NULL,
	[sifre] [nvarchar](100) NULL,
	[fotograf] [nvarchar](500) NULL,
 CONSTRAINT [PK_UyeDetayBilgileri] PRIMARY KEY CLUSTERED 
(
	[uyeDetayBilgiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 31.07.2019 16:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[yorumID] [int] IDENTITY(1,1) NOT NULL,
	[adSoyad] [nvarchar](50) NULL,
	[icerik] [nvarchar](500) NULL,
	[makaleID] [int] NULL,
	[tarih] [date] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[yorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([kategoriID])
REFERENCES [dbo].[Kategori] ([kategoriID])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_MakaleDetay] FOREIGN KEY([makaleDetayID])
REFERENCES [dbo].[MakaleDetay] ([makaleDetayID])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_MakaleDetay]
GO
ALTER TABLE [dbo].[Uye]  WITH CHECK ADD  CONSTRAINT [FK_Uye_Rol] FOREIGN KEY([rolID])
REFERENCES [dbo].[Rol] ([rolID])
GO
ALTER TABLE [dbo].[Uye] CHECK CONSTRAINT [FK_Uye_Rol]
GO
ALTER TABLE [dbo].[Uye]  WITH CHECK ADD  CONSTRAINT [FK_Uye_UyeDetay] FOREIGN KEY([uyeDetayBilgiID])
REFERENCES [dbo].[UyeDetay] ([uyeDetayBilgiID])
GO
ALTER TABLE [dbo].[Uye] CHECK CONSTRAINT [FK_Uye_UyeDetay]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([makaleID])
REFERENCES [dbo].[Makale] ([makaleID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [PersonalWebPageDB] SET  READ_WRITE 
GO
