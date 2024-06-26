USE [master]
GO
/****** Object:  Database [TruckingCar]    Script Date: 14.06.2024 13:17:53 ******/
CREATE DATABASE [TruckingCar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TruckingCar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TruckingCar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TruckingCar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TruckingCar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TruckingCar] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TruckingCar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TruckingCar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TruckingCar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TruckingCar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TruckingCar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TruckingCar] SET ARITHABORT OFF 
GO
ALTER DATABASE [TruckingCar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TruckingCar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TruckingCar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TruckingCar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TruckingCar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TruckingCar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TruckingCar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TruckingCar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TruckingCar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TruckingCar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TruckingCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TruckingCar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TruckingCar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TruckingCar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TruckingCar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TruckingCar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TruckingCar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TruckingCar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TruckingCar] SET  MULTI_USER 
GO
ALTER DATABASE [TruckingCar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TruckingCar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TruckingCar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TruckingCar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TruckingCar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TruckingCar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TruckingCar] SET QUERY_STORE = ON
GO
ALTER DATABASE [TruckingCar] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TruckingCar]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarMake] [varchar](300) NOT NULL,
	[NumberOfTheCar] [int] NOT NULL,
	[ProductionYear] [date] NOT NULL,
	[CityID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[PassportDetails] [varchar](50) NOT NULL,
	[DriverLicense] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[DateAndTimeForOrder] [datetime] NOT NULL,
	[CityID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[RentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.06.2024 13:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (1, N'nisan', 1234, CAST(N'2005-03-01' AS Date), 1, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (2, N'nisan', 2345, CAST(N'2005-03-01' AS Date), 1, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (3, N'nisan', 3421, CAST(N'2005-03-01' AS Date), 1, 5)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (4, N'nisan', 3495, CAST(N'2005-03-01' AS Date), 1, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (5, N'mazda', 5231, CAST(N'2004-06-01' AS Date), 2, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (6, N'mazda', 6432, CAST(N'2004-06-01' AS Date), 2, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (7, N'mazda', 9421, CAST(N'2004-06-01' AS Date), 2, 5)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (8, N'mazda', 7232, CAST(N'2004-06-01' AS Date), 2, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (9, N'bmw', 4516, CAST(N'2004-02-01' AS Date), 3, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (10, N'bmw', 6231, CAST(N'2004-02-01' AS Date), 3, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (11, N'bmw', 6346, CAST(N'2004-02-01' AS Date), 3, 5)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (12, N'bmw', 4351, CAST(N'2004-02-01' AS Date), 3, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (13, N'honday', 4516, CAST(N'2005-03-01' AS Date), 4, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (14, N'honday', 5722, CAST(N'2005-03-01' AS Date), 4, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (15, N'honday', 8525, CAST(N'2005-03-01' AS Date), 4, 5)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (16, N'honday', 1324, CAST(N'2005-03-01' AS Date), 4, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (17, N'mazda', 5242, CAST(N'2005-04-01' AS Date), 5, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (18, N'opel', 6235, CAST(N'2003-05-01' AS Date), 5, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (19, N'deo', 9423, CAST(N'2006-03-01' AS Date), 5, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (20, N'chery', 8534, CAST(N'2020-04-01' AS Date), 5, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (21, N'lada', 5455, CAST(N'2007-04-01' AS Date), 5, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (22, N'grve', 6545, CAST(N'2008-04-01' AS Date), 6, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (23, N'kftvebtr', 2542, CAST(N'2010-09-01' AS Date), 7, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (24, N'mitsubisy', 6543, CAST(N'2006-08-01' AS Date), 8, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (25, N'ford', 6545, CAST(N'2009-05-01' AS Date), 9, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (26, N'ford', 6453, CAST(N'2009-05-01' AS Date), 1, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (27, N'ford', 6852, CAST(N'2005-09-01' AS Date), 4, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (28, N'volvo', 6234, CAST(N'2006-05-01' AS Date), 3, 4)
INSERT [dbo].[Cars] ([CarID], [CarMake], [NumberOfTheCar], [ProductionYear], [CityID], [StatusID]) VALUES (29, N'volvo', 9234, CAST(N'2009-03-01' AS Date), 6, 4)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (1, N'Адлер')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (2, N'Анапа')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (3, N'Архангельск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (4, N'Архипо-Осиповка')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (5, N'Архыз')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (6, N'Астрахань')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (7, N'Балтийск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (8, N'Барнаул')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (9, N'Белогорск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (10, N'Белокуриха')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (11, N'Береговое')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (12, N'Бетта')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (13, N'Благовещенская')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (14, N'Великий Новгород')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (15, N'Великий Устюг')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (16, N'Веселовка')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (17, N'Витязево')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (18, N'Владивосток')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (19, N'Владикавказ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (20, N'Владимир')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (21, N'Волгоград')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (22, N'Вологда')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (23, N'Выборг')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (24, N'Вышний Волочек')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (25, N'Вязьма')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (26, N'Гаврилов Посад')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (27, N'Гаспра')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (28, N'Гатчина')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (29, N'Геленджик')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (30, N'Голубицкая')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (31, N'Горно-Алтайск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (32, N'Горячий Ключ')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (33, N'Грозный')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (34, N'Гурзуф')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (35, N'Дагомыс')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (36, N'Дарасун')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (37, N'Дербент')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (38, N'Джанхот')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (41, N'Дивеево')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (42, N'Дивноморское')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (43, N'Дмитров')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (44, N'Домбай')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (45, N'Евпатория')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (46, N'Ейск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (47, N'Екатеринбург')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (48, N'Елабуга')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (49, N'Ессентуки')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (50, N'Железноводск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (51, N'Зарайск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (52, N'Звенигород')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (53, N'Зеленоградск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (54, N'Золотое')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (55, N'Ивангород')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (56, N'Иваново')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (57, N'Ижевск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (58, N'Избербаш')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (59, N'Иркутск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (60, N'Истра')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (61, N'Йошкар-Ола')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (62, N'Кабардинка')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (63, N'Казань')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (64, N'Калининград')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (65, N'Калуга')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (66, N'Калязин')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (67, N'Касимов')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (68, N'Каспийск')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (69, N'Каякент')
INSERT [dbo].[Cities] ([CityID], [CityName]) VALUES (70, N'Кемерово')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (1, 3, N'Aleksei', N'Ivanov', N'89995558855', N'1234 123456', N'123456123456')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (2, 4, N'Gleb', N'Ivanov', N'83337773344', N'1231 098765', N'098765456789')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (3, 2, N'User', N'Pass', N'11111111111', N'3458 874321', N'374029384074')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (4, 5, N'kirill', N'kirill', N'22222222222', N'3454 346345', N'246435667564')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (5, 6, N'olga', N'olga', N'33333333333', N'1234 563456', N'564565473625')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (6, 7, N'oleg', N'oleg', N'44444444444', N'9732 032942', N'239572039457')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (7, 8, N'ira', N'ira', N'55555555555', N'4235 254451', N'234512345653')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (8, 9, N'misha', N'misha', N'66666666666', N'6434 987452', N'982435923452')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (9, 10, N'sofa', N'sofa', N'77777777777', N'5452 423525', N'456565234151')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (10, 11, N'katiy', N'katiy', N'88888888888', N'8945 983245', N'542456232345')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (11, 12, N'vova', N'vova', N'99999999999', N'5256 542623', N'243665465223')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (12, 13, N'natasha', N'natasha', N'10101010101', N'5656 542612', N'651236545113')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (13, 14, N'valy', N'valy', N'45245634156', N'6542 987234', N'908437520432')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (14, 15, N'vladimir', N'vladimir', N'98436519234', N'9843 095723', N'895023450324')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (15, 16, N'der', N'der', N'87162349412', N'9874 598453', N'490284523425')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (16, 17, N'wer', N'wer', N'45745647634', N'5762 567524', N'687345667343')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (17, 18, N'far', N'far', N'67345634543', N'3456 354623', N'768354621545')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (18, 19, N'hero', N'hero', N'56462555462', N'2654 452645', N'532546324643')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (19, 20, N'vera', N'vera', N'67562345452', N'6745 635257', N'878746346146')
INSERT [dbo].[Clients] ([ClientID], [UserID], [Name], [Surname], [Phone], [PassportDetails], [DriverLicense]) VALUES (20, 21, N'driam', N'driam', N'76535462452', N'6437 375623', N'763656265572')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (1, 1, 1, CAST(N'2024-06-05T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (2, 1, 2, CAST(N'2024-06-06T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (3, 1, 4, CAST(N'2024-06-08T00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (4, 1, 7, CAST(N'2024-06-14T09:04:34.457' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (5, 1, 15, CAST(N'2024-06-14T09:05:03.673' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (6, 4, 7, CAST(N'2024-06-14T09:14:55.987' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (7, 5, 6, CAST(N'2024-06-14T09:15:18.807' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (8, 11, 4, CAST(N'2024-06-14T09:17:33.293' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (9, 1, 10, CAST(N'2024-06-14T09:20:54.033' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (10, 11, 7, CAST(N'2024-06-14T09:23:07.697' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (11, 13, 6, CAST(N'2024-06-14T09:27:24.870' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (12, 11, 10, CAST(N'2024-06-14T09:33:51.423' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (13, 11, 5, CAST(N'2024-06-14T09:36:33.687' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (14, 11, 4, CAST(N'2024-06-14T09:37:36.087' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (15, 11, 14, CAST(N'2024-06-14T09:40:07.223' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (16, 13, 2, CAST(N'2024-06-14T09:41:21.413' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (17, 13, 7, CAST(N'2024-06-14T09:42:34.090' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (18, 13, 8, CAST(N'2024-06-14T09:43:20.503' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (19, 13, 7, CAST(N'2024-06-14T09:43:51.833' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (20, 4, 11, CAST(N'2024-06-14T09:44:53.823' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (21, 1, 11, CAST(N'2024-06-14T09:45:51.103' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (22, 1, 12, CAST(N'2024-06-14T09:48:31.490' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (23, 1, 13, CAST(N'2024-06-14T09:49:18.413' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (24, 1, 14, CAST(N'2024-06-14T09:53:04.623' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (25, 1, 7, CAST(N'2024-06-14T10:03:04.420' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (26, 1, 14, CAST(N'2024-06-14T10:03:57.243' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (27, 1, 11, CAST(N'2024-06-14T10:08:16.077' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (28, 11, 11, CAST(N'2024-06-14T10:11:44.157' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (29, 11, 14, CAST(N'2024-06-14T10:19:14.237' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (30, 11, 16, CAST(N'2024-06-14T10:20:58.087' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (31, 11, 15, CAST(N'2024-06-14T10:22:56.003' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (32, 11, 14, CAST(N'2024-06-14T10:24:42.373' AS DateTime), 4, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (33, 13, 12, CAST(N'2024-06-14T10:26:11.983' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (34, 11, 8, CAST(N'2024-06-14T10:28:37.893' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (35, 4, 7, CAST(N'2024-06-14T10:29:36.960' AS DateTime), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (36, 1, 4, CAST(N'2024-06-14T11:30:47.583' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (37, 1, 4, CAST(N'2024-06-14T12:08:48.830' AS DateTime), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [ClientID], [CarID], [DateAndTimeForOrder], [CityID], [StatusID]) VALUES (38, 3, 29, CAST(N'2024-06-14T12:48:28.030' AS DateTime), 6, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (1, 1, CAST(N'2024-06-05T12:00:00.000' AS DateTime), CAST(N'2024-06-05T12:30:00.000' AS DateTime), 500.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (2, 2, CAST(N'2024-06-06T17:24:00.000' AS DateTime), CAST(N'2024-06-06T18:03:00.000' AS DateTime), 600.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (3, 29, CAST(N'2024-06-14T10:19:16.690' AS DateTime), CAST(N'2024-06-14T10:19:28.613' AS DateTime), 0.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (4, 30, CAST(N'2024-06-14T10:21:01.297' AS DateTime), CAST(N'2024-06-14T10:21:16.650' AS DateTime), 1000.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (5, 31, CAST(N'2024-06-14T10:22:59.517' AS DateTime), CAST(N'2024-06-14T10:23:36.853' AS DateTime), 0.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (6, 32, CAST(N'2024-06-14T10:24:45.233' AS DateTime), CAST(N'2024-06-14T10:25:04.827' AS DateTime), 1.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (7, 33, CAST(N'2024-06-14T10:26:14.130' AS DateTime), CAST(N'2024-06-14T10:26:52.200' AS DateTime), 34.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (8, 34, CAST(N'2024-06-14T10:28:41.907' AS DateTime), CAST(N'2024-06-14T10:28:43.060' AS DateTime), 1.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (9, 35, CAST(N'2024-06-14T10:29:39.837' AS DateTime), CAST(N'2024-06-14T10:29:54.217' AS DateTime), 13.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (10, 36, CAST(N'2024-06-14T11:30:51.333' AS DateTime), CAST(N'2024-06-14T11:31:12.430' AS DateTime), 20.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (11, 37, CAST(N'2024-06-14T12:08:51.557' AS DateTime), CAST(N'2024-06-14T12:09:00.097' AS DateTime), 8.0000)
INSERT [dbo].[Rentals] ([RentID], [OrderID], [StartTime], [EndTime], [Price]) VALUES (12, 38, CAST(N'2024-06-14T12:48:30.550' AS DateTime), CAST(N'2024-06-14T12:48:40.093' AS DateTime), 8.0000)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Менеджер')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (1, N'В обработке')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (2, N'Одобрено')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (3, N'Не одобрено')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (4, N'На ходу')
INSERT [dbo].[Statuses] ([StatusID], [StatusName]) VALUES (5, N'В ремонте')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (2, N'user', N'pass', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (3, N'aleksei', N'aleksei', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (4, N'gleb', N'gleb', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (5, N'kirill', N'kirill', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (6, N'olga', N'olga', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (7, N'oleg', N'oleg', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (8, N'ira', N'ira', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (9, N'misha', N'misha', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (10, N'sofa', N'sofa', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (11, N'katiy', N'katiy', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (12, N'vova', N'vova', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (13, N'natasha', N'natasha', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (14, N'valy', N'valy', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (15, N'vladimir', N'vladimir', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (16, N'der', N'der', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (17, N'wer', N'wer', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (18, N'far', N'far', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (19, N'hero', N'hero', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (20, N'vera', N'vera', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (21, N'driam', N'driam', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (22, N'war', N'war', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (23, N'qwin', N'qwin', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (24, N'kloy', N'kloy', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (25, N'groy', N'groy', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (26, N'ser', N'ser', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (27, N'mer', N'mer', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (28, N'star', N'star', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (29, N'nol', N'nol', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (30, N'bert', N'bert', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (31, N'darst', N'darst', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (32, N'nor', N'nor', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (33, N'sert', N'sert', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (34, N'herj', N'herj', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (35, N'nert', N'nert', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (36, N'ger', N'ger', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (37, N'mert', N'mert', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (38, N'port', N'port', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (39, N'postr', N'postr', 2)
INSERT [dbo].[Users] ([UserID], [Login], [Password], [RoleID]) VALUES (40, N'art', N'art', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Cities]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Statuses]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cars]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Cities]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Statuses]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Orders]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [TruckingCar] SET  READ_WRITE 
GO
