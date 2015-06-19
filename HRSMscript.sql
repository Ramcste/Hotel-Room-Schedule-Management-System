USE [master]
GO
/****** Object:  Database [HRSM]    Script Date: 19-06-2015 03:50:06 PM ******/
CREATE DATABASE [HRSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRSM', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HRSM.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HRSM_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HRSM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRSM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRSM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HRSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HRSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRSM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HRSM] SET  MULTI_USER 
GO
ALTER DATABASE [HRSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRSM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HRSM]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19-06-2015 03:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 19-06-2015 03:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleRoom]    Script Date: 19-06-2015 03:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleRoom](
	[Sc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Room_Id] [int] NOT NULL,
	[BookedDate] [varchar](50) NOT NULL,
	[BookedBy] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduleRoom] PRIMARY KEY CLUSTERED 
(
	[Sc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'AC')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Non-AC')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomNo], [CategoryId], [Description]) VALUES (1, 100, 1, N'Very Comfortable')
INSERT [dbo].[Room] ([Id], [RoomNo], [CategoryId], [Description]) VALUES (4, 101, 1, N'')
INSERT [dbo].[Room] ([Id], [RoomNo], [CategoryId], [Description]) VALUES (5, 102, 1, N'Luxious')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[ScheduleRoom] ON 

INSERT [dbo].[ScheduleRoom] ([Sc_Id], [Category_Id], [Room_Id], [BookedDate], [BookedBy], [Address]) VALUES (1, 1, 1, N'01-01-0001 12:00:00 AM', N'Rambabu Kushwaha', N'Dhaka')
INSERT [dbo].[ScheduleRoom] ([Sc_Id], [Category_Id], [Room_Id], [BookedDate], [BookedBy], [Address]) VALUES (2, 1, 1, N'19-06-2015 12:00:00 AM', N'Mizanur Rahman', N'Noakhali')
INSERT [dbo].[ScheduleRoom] ([Sc_Id], [Category_Id], [Room_Id], [BookedDate], [BookedBy], [Address]) VALUES (3, 1, 4, N'19-06-2015 12:00:00 AM', N'frf', N'thh')
SET IDENTITY_INSERT [dbo].[ScheduleRoom] OFF
USE [master]
GO
ALTER DATABASE [HRSM] SET  READ_WRITE 
GO
