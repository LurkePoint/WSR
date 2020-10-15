USE [master]
GO
/****** Object:  Database [wsr_uzenkov]    Script Date: 15.10.2020 13:30:18 ******/
CREATE DATABASE [wsr_uzenkov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wsr_uzenkov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\wsr_uzenkov.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'wsr_uzenkov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\wsr_uzenkov_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wsr_uzenkov] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wsr_uzenkov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wsr_uzenkov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET ARITHABORT OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wsr_uzenkov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wsr_uzenkov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wsr_uzenkov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wsr_uzenkov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wsr_uzenkov] SET  MULTI_USER 
GO
ALTER DATABASE [wsr_uzenkov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wsr_uzenkov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wsr_uzenkov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wsr_uzenkov] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [wsr_uzenkov] SET DELAYED_DURABILITY = DISABLED 
GO
USE [wsr_uzenkov]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [nchar](10) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreveiw] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 15.10.2020 13:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [wsr_uzenkov] SET  READ_WRITE 
GO
