USE [master]
GO
/****** Object:  Database [TsirkBase]    Script Date: 12.03.2024 19:53:56 ******/
CREATE DATABASE [TsirkBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TsirkBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\TsirkBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TsirkBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\TsirkBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TsirkBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TsirkBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TsirkBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TsirkBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TsirkBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TsirkBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TsirkBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TsirkBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TsirkBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TsirkBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TsirkBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TsirkBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TsirkBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TsirkBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TsirkBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TsirkBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TsirkBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TsirkBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TsirkBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TsirkBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TsirkBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TsirkBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TsirkBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TsirkBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TsirkBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TsirkBase] SET  MULTI_USER 
GO
ALTER DATABASE [TsirkBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TsirkBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TsirkBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TsirkBase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TsirkBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TsirkBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TsirkBase', N'ON'
GO
ALTER DATABASE [TsirkBase] SET QUERY_STORE = OFF
GO
USE [TsirkBase]
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[aviary] [int] NOT NULL,
 CONSTRAINT [PK_Animals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aviaries]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aviaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Aviaries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[comment] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[comment] [nvarchar](255) NOT NULL,
	[is_close] [tinyint] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workouts]    Script Date: 12.03.2024 19:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[animal_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[is_end] [tinyint] NOT NULL,
 CONSTRAINT [PK_Workouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aviaries] ON 

INSERT [dbo].[Aviaries] ([id], [title]) VALUES (1, N'Большой')
INSERT [dbo].[Aviaries] ([id], [title]) VALUES (4, N'Обычный')
INSERT [dbo].[Aviaries] ([id], [title]) VALUES (5, N'Необычный')
INSERT [dbo].[Aviaries] ([id], [title]) VALUES (6, N'Еще один обычный')
SET IDENTITY_INSERT [dbo].[Aviaries] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [title]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([id], [title]) VALUES (2, N'Артист')
INSERT [dbo].[Roles] ([id], [title]) VALUES (3, N'Дрессировщик')
INSERT [dbo].[Roles] ([id], [title]) VALUES (4, N'Обслуживающий персонал')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [login], [password], [name], [last_name], [role]) VALUES (1, N'a', N'a', N'admin', N'main', 1)
INSERT [dbo].[Users] ([id], [login], [password], [name], [last_name], [role]) VALUES (5, N'ac', N'ac', N'ac', N'ac', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_Aviaries] FOREIGN KEY([aviary])
REFERENCES [dbo].[Aviaries] ([id])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_Aviaries]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Users1] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Workouts]  WITH CHECK ADD  CONSTRAINT [FK_Workouts_Animals] FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animals] ([id])
GO
ALTER TABLE [dbo].[Workouts] CHECK CONSTRAINT [FK_Workouts_Animals]
GO
ALTER TABLE [dbo].[Workouts]  WITH CHECK ADD  CONSTRAINT [FK_Workouts_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Workouts] CHECK CONSTRAINT [FK_Workouts_Users]
GO
USE [master]
GO
ALTER DATABASE [TsirkBase] SET  READ_WRITE 
GO
