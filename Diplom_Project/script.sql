USE [master]
GO
/****** Object:  Database [logistic_services]    Script Date: 07.06.2022 21:13:19 ******/
CREATE DATABASE [logistic_services]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'logistic_services', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logistic_services.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'logistic_services_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\logistic_services_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [logistic_services] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [logistic_services].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [logistic_services] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [logistic_services] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [logistic_services] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [logistic_services] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [logistic_services] SET ARITHABORT OFF 
GO
ALTER DATABASE [logistic_services] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [logistic_services] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [logistic_services] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [logistic_services] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [logistic_services] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [logistic_services] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [logistic_services] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [logistic_services] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [logistic_services] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [logistic_services] SET  DISABLE_BROKER 
GO
ALTER DATABASE [logistic_services] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [logistic_services] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [logistic_services] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [logistic_services] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [logistic_services] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [logistic_services] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [logistic_services] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [logistic_services] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [logistic_services] SET  MULTI_USER 
GO
ALTER DATABASE [logistic_services] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [logistic_services] SET DB_CHAINING OFF 
GO
ALTER DATABASE [logistic_services] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [logistic_services] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [logistic_services] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [logistic_services] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [logistic_services] SET QUERY_STORE = OFF
GO
USE [logistic_services]
GO
/****** Object:  Table [dbo].[auto]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto](
	[id_auto] [int] NOT NULL,
	[stamp] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_auto] PRIMARY KEY CLUSTERED 
(
	[id_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auto_fill]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto_fill](
	[id_autofill] [int] NOT NULL,
	[fill_date] [date] NOT NULL,
	[id_exauto] [int] NOT NULL,
	[litres] [int] NOT NULL,
	[id_fuel] [int] NOT NULL,
 CONSTRAINT [PK_auto_fill] PRIMARY KEY CLUSTERED 
(
	[id_autofill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[id_cargo] [int] NOT NULL,
	[cargo_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_cargo] PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoty]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoty](
	[id_category] [int] NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_categoty] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id_clients] [int] NOT NULL,
	[adress] [nvarchar](max) NOT NULL,
	[telefone] [nvarchar](50) NOT NULL,
	[id_status] [int] NOT NULL,
	[id_contact_person] [int] NOT NULL,
	[id_executor] [int] NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id_clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver_]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver_](
	[id_driver] [int] NOT NULL,
	[id_people] [int] NOT NULL,
	[driver_license] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Driver_] PRIMARY KEY CLUSTERED 
(
	[id_driver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driver_cat]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver_cat](
	[id_driver_cat] [int] NOT NULL,
	[id_driver] [int] NOT NULL,
	[id_category] [int] NOT NULL,
	[date_cat] [date] NOT NULL,
 CONSTRAINT [PK_driver_cat] PRIMARY KEY CLUSTERED 
(
	[id_driver_cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExAuto]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExAuto](
	[id_exauto] [int] NOT NULL,
	[gos_number] [nvarchar](50) NOT NULL,
	[vin_code] [nvarchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[mileage] [int] NOT NULL,
	[id_auto] [int] NOT NULL,
	[id_fuel] [int] NOT NULL,
	[date_TO] [date] NOT NULL,
	[fuel_charge] [int] NOT NULL,
 CONSTRAINT [PK_ExAuto] PRIMARY KEY CLUSTERED 
(
	[id_exauto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fuel]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fuel](
	[id_fuel] [int] NOT NULL,
	[fueil_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_fuel] PRIMARY KEY CLUSTERED 
(
	[id_fuel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaders_order]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaders_order](
	[id_LO] [int] NOT NULL,
	[id_staff] [int] NOT NULL,
	[id_orders] [int] NOT NULL,
 CONSTRAINT [PK_loaders_order] PRIMARY KEY CLUSTERED 
(
	[id_LO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logins]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[id_login] [int] NOT NULL,
	[Login_name] [nvarchar](50) NOT NULL,
	[id_people] [int] NOT NULL,
	[id_user_group] [int] NOT NULL,
	[passwords] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_logins] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id_order] [int] NOT NULL,
	[id_driver] [int] NOT NULL,
	[id_exauto] [int] NOT NULL,
	[id_cargo] [int] NOT NULL,
	[start_location] [nvarchar](max) NOT NULL,
	[ends_location] [nvarchar](max) NOT NULL,
	[distance] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[finish_date] [date] NOT NULL,
	[loaders] [int] NOT NULL,
	[price] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[weight] [int] NOT NULL,
	[dimensions] [numeric](18, 2) NOT NULL,
	[id_client] [int] NOT NULL,
	[id_manager] [int] NOT NULL,
	[id_statusorder] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id_people] [int] NOT NULL,
	[FIO] [nvarchar](max) NOT NULL,
	[Passport] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Telefone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id_people] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id_post] [int] NOT NULL,
	[post_name] [nvarchar](50) NOT NULL,
	[salary] [int] NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreOrder_2]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreOrder_2](
	[id_PreOrder] [int] NOT NULL,
	[Start_location] [nvarchar](max) NOT NULL,
	[End_location] [nvarchar](max) NOT NULL,
	[Order_date] [date] NOT NULL,
	[End_date] [date] NOT NULL,
	[weight] [int] NOT NULL,
	[dimensions] [numeric](18, 2) NOT NULL,
	[id_login] [int] NOT NULL,
 CONSTRAINT [PK_PreOrder_2] PRIMARY KEY CLUSTERED 
(
	[id_PreOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id_staff] [int] NOT NULL,
	[id_people] [int] NOT NULL,
	[id_post] [int] NOT NULL,
	[bonus] [int] NOT NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id_status] [int] NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusorder]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusorder](
	[id_statusorder] [int] NOT NULL,
	[statusorder_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_statusorder] PRIMARY KEY CLUSTERED 
(
	[id_statusorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_group]    Script Date: 07.06.2022 21:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_group](
	[id_UG] [int] NOT NULL,
	[group_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_group] PRIMARY KEY CLUSTERED 
(
	[id_UG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[auto] ([id_auto], [stamp], [model]) VALUES (1, N'ГАЗ', N'ГАЗель Next')
INSERT [dbo].[auto] ([id_auto], [stamp], [model]) VALUES (2, N'Mercedes-Benz', N'Sprinter')
INSERT [dbo].[auto] ([id_auto], [stamp], [model]) VALUES (3, N'Ford', N'Transit')
GO
INSERT [dbo].[auto_fill] ([id_autofill], [fill_date], [id_exauto], [litres], [id_fuel]) VALUES (1, CAST(N'2022-03-06' AS Date), 1, 60, 2)
INSERT [dbo].[auto_fill] ([id_autofill], [fill_date], [id_exauto], [litres], [id_fuel]) VALUES (2, CAST(N'2022-03-05' AS Date), 2, 45, 2)
INSERT [dbo].[auto_fill] ([id_autofill], [fill_date], [id_exauto], [litres], [id_fuel]) VALUES (3, CAST(N'2022-03-04' AS Date), 3, 80, 2)
GO
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (1, N'Кресло')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (2, N'Стол кухонный')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (3, N'Стиральная машина')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (4, N'Холодильник')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (5, N'Диван')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (6, N'Кровать')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (7, N'Тумбочка')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (8, N'Шкаф-купе')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (9, N'Духовая печь')
INSERT [dbo].[cargo] ([id_cargo], [cargo_name]) VALUES (10, N'Шкаф навесной')
GO
INSERT [dbo].[categoty] ([id_category], [cat_name]) VALUES (1, N'BE')
INSERT [dbo].[categoty] ([id_category], [cat_name]) VALUES (2, N'C')
INSERT [dbo].[categoty] ([id_category], [cat_name]) VALUES (3, N'CE')
INSERT [dbo].[categoty] ([id_category], [cat_name]) VALUES (4, N'B')
GO
INSERT [dbo].[client] ([id_clients], [adress], [telefone], [id_status], [id_contact_person], [id_executor]) VALUES (1, N'аврпипмвураипм', N'9654512345', 1, 4, 4)
INSERT [dbo].[client] ([id_clients], [adress], [telefone], [id_status], [id_contact_person], [id_executor]) VALUES (2, N'гуккрепкрпгшкрпе', N'9123545465', 2, 5, 5)
INSERT [dbo].[client] ([id_clients], [adress], [telefone], [id_status], [id_contact_person], [id_executor]) VALUES (3, N'цруаирцйуамцпмуашкуцка', N'9035141641', 3, 6, 6)
INSERT [dbo].[client] ([id_clients], [adress], [telefone], [id_status], [id_contact_person], [id_executor]) VALUES (6, N'werg2eeg1eergg', N'9156324458', 2, 4, 4)
GO
INSERT [dbo].[Driver_] ([id_driver], [id_people], [driver_license]) VALUES (1, 2, N'8949648')
INSERT [dbo].[Driver_] ([id_driver], [id_people], [driver_license]) VALUES (2, 7, N'5615445')
GO
INSERT [dbo].[driver_cat] ([id_driver_cat], [id_driver], [id_category], [date_cat]) VALUES (1, 1, 2, CAST(N'1994-06-03' AS Date))
INSERT [dbo].[driver_cat] ([id_driver_cat], [id_driver], [id_category], [date_cat]) VALUES (2, 2, 3, CAST(N'1990-08-18' AS Date))
GO
INSERT [dbo].[ExAuto] ([id_exauto], [gos_number], [vin_code], [year], [mileage], [id_auto], [id_fuel], [date_TO], [fuel_charge]) VALUES (1, N'Т308ЕУ750', N'2GCDC14H9B1172761', 2018, 75000, 1, 2, CAST(N'2022-03-06' AS Date), 100)
INSERT [dbo].[ExAuto] ([id_exauto], [gos_number], [vin_code], [year], [mileage], [id_auto], [id_fuel], [date_TO], [fuel_charge]) VALUES (2, N'В802МХ77', N'JH4DA9460PS008002', 2012, 356000, 2, 2, CAST(N'2022-03-06' AS Date), 120)
INSERT [dbo].[ExAuto] ([id_exauto], [gos_number], [vin_code], [year], [mileage], [id_auto], [id_fuel], [date_TO], [fuel_charge]) VALUES (3, N'С176УА777', N'JH4CC2660PC002236', 2021, 0, 3, 2, CAST(N'2021-01-01' AS Date), 135)
GO
INSERT [dbo].[fuel] ([id_fuel], [fueil_name]) VALUES (1, N'Бензин')
INSERT [dbo].[fuel] ([id_fuel], [fueil_name]) VALUES (2, N'Дизель')
INSERT [dbo].[fuel] ([id_fuel], [fueil_name]) VALUES (3, N'ГБО')
GO
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (1, N'NaumovD', 1, 3, N'123')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (2, N'KotovaS', 8, 4, N'TextBox')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (3, N'MuhinaA', 9, 3, N'123')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (4, N'AlexandrovaP', 10, 3, N'0000')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (5, N'guest', 11, 4, N'  ')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (6, N'test', 1, 2, N'123')
INSERT [dbo].[logins] ([id_login], [Login_name], [id_people], [id_user_group], [passwords]) VALUES (7, N'pavlovP', 14, 1, N'123456')
GO
INSERT [dbo].[orders] ([id_order], [id_driver], [id_exauto], [id_cargo], [start_location], [ends_location], [distance], [order_date], [finish_date], [loaders], [price], [cost], [weight], [dimensions], [id_client], [id_manager], [id_statusorder]) VALUES (1, 1, 1, 1, N'Фруктовая', N'Старый город', 25, CAST(N'2022-05-30' AS Date), CAST(N'2022-06-02' AS Date), 0, 6000, 4500, 45, CAST(0.08 AS Numeric(18, 2)), 1, 1, 3)
INSERT [dbo].[orders] ([id_order], [id_driver], [id_exauto], [id_cargo], [start_location], [ends_location], [distance], [order_date], [finish_date], [loaders], [price], [cost], [weight], [dimensions], [id_client], [id_manager], [id_statusorder]) VALUES (2, 2, 2, 2, N'Старый город', N'Голутвин', 5, CAST(N'2022-06-01' AS Date), CAST(N'2022-06-02' AS Date), 0, 2000, 1000, 100, CAST(0.10 AS Numeric(18, 2)), 2, 1, 2)
INSERT [dbo].[orders] ([id_order], [id_driver], [id_exauto], [id_cargo], [start_location], [ends_location], [distance], [order_date], [finish_date], [loaders], [price], [cost], [weight], [dimensions], [id_client], [id_manager], [id_statusorder]) VALUES (3, 1, 1, 1, N'Каховка', N'Вернадка', 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-05-10' AS Date), 1, 1, 1, 1, CAST(1.00 AS Numeric(18, 2)), 6, 6, 2)
INSERT [dbo].[orders] ([id_order], [id_driver], [id_exauto], [id_cargo], [start_location], [ends_location], [distance], [order_date], [finish_date], [loaders], [price], [cost], [weight], [dimensions], [id_client], [id_manager], [id_statusorder]) VALUES (4, 1, 3, 3, N'Старый город', N'Набережная', 7, CAST(N'2022-02-03' AS Date), CAST(N'2022-02-05' AS Date), 2, 4500, 2000, 300, CAST(1.00 AS Numeric(18, 2)), 3, 6, 1)
INSERT [dbo].[orders] ([id_order], [id_driver], [id_exauto], [id_cargo], [start_location], [ends_location], [distance], [order_date], [finish_date], [loaders], [price], [cost], [weight], [dimensions], [id_client], [id_manager], [id_statusorder]) VALUES (5, 2, 1, 4, N'Зарайск', N'Луховицы', 25, CAST(N'2022-02-02' AS Date), CAST(N'2022-06-09' AS Date), 2, 4000, 1750, 500, CAST(0.60 AS Numeric(18, 2)), 6, 6, 3)
GO
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (1, N'Наумов Демид Ярославович', N'185642000', CAST(N'1984-01-12' AS Date), N'9856310265')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (2, N'Осипов Николай Владимирович', N'265487852', CAST(N'1976-05-03' AS Date), N'9632476521')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (3, N'Богданов Вячеслав Иванович', N'783124053', CAST(N'1980-03-21' AS Date), N'9035640185')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (4, N'Медведев Николай Дмитриевич', N'785465123', CAST(N'1979-09-21' AS Date), N'9456521547')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (5, N'Кузнецов Марк Тимофеевич', N'214578936', CAST(N'1984-06-01' AS Date), N'9031245675')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (6, N'Смирнов Иван Александрович', N'147586214', CAST(N'1986-02-07' AS Date), N'9015687456')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (7, N'Леонов Константин Павлович', N'156487895', CAST(N'1998-04-15' AS Date), N'9094154654')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (8, N'Котова София Дмитриевна', N'165849874', CAST(N'1989-02-17' AS Date), N'9651234785')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (9, N'Мухина Анна Васильевна', N'158498464', CAST(N'1979-11-11' AS Date), N'9845451312')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (10, N'Александрова Полина Михайловна', N'198748977', CAST(N'1988-12-19' AS Date), N'9841511354')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (11, N'guest', N'0', CAST(N'1900-01-01' AS Date), N'')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (12, N'Евдокимов Вадим Глебович', N'4602598741', CAST(N'1962-01-03' AS Date), N'9874514591')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (13, N'TextBox', N'TextBox', CAST(N'2022-06-08' AS Date), N'TextBox')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (14, N'Павлов Кирилл Олегович', N'4619456123', CAST(N'2002-03-14' AS Date), N'9445645612')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (15, N'Павлов Кирилл Олегович', N'4619456123', CAST(N'2002-03-14' AS Date), N'9445645612')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (16, N'Павлов Кирилл Олегович', N'4619456123', CAST(N'2002-03-14' AS Date), N'9445645612')
INSERT [dbo].[People] ([id_people], [FIO], [Passport], [Birthday], [Telefone]) VALUES (17, N'Иванов Иван Иванович', N'4680165478', CAST(N'1980-06-20' AS Date), N'9651849856')
GO
INSERT [dbo].[post] ([id_post], [post_name], [salary]) VALUES (1, N'Водитель', 50000)
INSERT [dbo].[post] ([id_post], [post_name], [salary]) VALUES (2, N'Менеджер', 46000)
INSERT [dbo].[post] ([id_post], [post_name], [salary]) VALUES (3, N'Грузчик', 35000)
GO
INSERT [dbo].[PreOrder_2] ([id_PreOrder], [Start_location], [End_location], [Order_date], [End_date], [weight], [dimensions], [id_login]) VALUES (120, N'Каховка', N'Вернадка', CAST(N'2022-06-04' AS Date), CAST(N'2022-06-05' AS Date), 1, CAST(1.00 AS Numeric(18, 2)), 6)
INSERT [dbo].[PreOrder_2] ([id_PreOrder], [Start_location], [End_location], [Order_date], [End_date], [weight], [dimensions], [id_login]) VALUES (121, N'Каховка', N'Вернадка', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-22' AS Date), 1, CAST(1.00 AS Numeric(18, 2)), 6)
GO
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (1, 1, 2, 5000)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (2, 2, 3, 7000)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (3, 3, 3, 2500)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (4, 7, 1, 3000)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (5, 4, 3, 7500)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (6, 5, 1, 5000)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (7, 13, 1, 5000)
INSERT [dbo].[staff] ([id_staff], [id_people], [id_post], [bonus]) VALUES (8, 17, 1, 5000)
GO
INSERT [dbo].[Status] ([id_status], [status_name]) VALUES (1, N'Стандарт')
INSERT [dbo].[Status] ([id_status], [status_name]) VALUES (2, N'Премиум')
INSERT [dbo].[Status] ([id_status], [status_name]) VALUES (3, N'ВИП')
GO
INSERT [dbo].[statusorder] ([id_statusorder], [statusorder_name]) VALUES (1, N'В обработке')
INSERT [dbo].[statusorder] ([id_statusorder], [statusorder_name]) VALUES (2, N'Исполнен')
INSERT [dbo].[statusorder] ([id_statusorder], [statusorder_name]) VALUES (3, N'Отменен')
GO
INSERT [dbo].[user_group] ([id_UG], [group_name]) VALUES (1, N'admin')
INSERT [dbo].[user_group] ([id_UG], [group_name]) VALUES (2, N'manager')
INSERT [dbo].[user_group] ([id_UG], [group_name]) VALUES (3, N'client')
INSERT [dbo].[user_group] ([id_UG], [group_name]) VALUES (4, N'guest')
GO
ALTER TABLE [dbo].[auto_fill]  WITH CHECK ADD  CONSTRAINT [FK_auto_fill_ExAuto] FOREIGN KEY([id_exauto])
REFERENCES [dbo].[ExAuto] ([id_exauto])
GO
ALTER TABLE [dbo].[auto_fill] CHECK CONSTRAINT [FK_auto_fill_ExAuto]
GO
ALTER TABLE [dbo].[auto_fill]  WITH CHECK ADD  CONSTRAINT [FK_auto_fill_fuel] FOREIGN KEY([id_fuel])
REFERENCES [dbo].[fuel] ([id_fuel])
GO
ALTER TABLE [dbo].[auto_fill] CHECK CONSTRAINT [FK_auto_fill_fuel]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_People] FOREIGN KEY([id_contact_person])
REFERENCES [dbo].[People] ([id_people])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_People]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_People1] FOREIGN KEY([id_executor])
REFERENCES [dbo].[People] ([id_people])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_People1]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_Status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status] ([id_status])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_Status]
GO
ALTER TABLE [dbo].[Driver_]  WITH CHECK ADD  CONSTRAINT [FK_Driver__People] FOREIGN KEY([id_people])
REFERENCES [dbo].[People] ([id_people])
GO
ALTER TABLE [dbo].[Driver_] CHECK CONSTRAINT [FK_Driver__People]
GO
ALTER TABLE [dbo].[driver_cat]  WITH CHECK ADD  CONSTRAINT [FK_driver_cat_categoty] FOREIGN KEY([id_category])
REFERENCES [dbo].[categoty] ([id_category])
GO
ALTER TABLE [dbo].[driver_cat] CHECK CONSTRAINT [FK_driver_cat_categoty]
GO
ALTER TABLE [dbo].[driver_cat]  WITH CHECK ADD  CONSTRAINT [FK_driver_cat_Driver_] FOREIGN KEY([id_driver])
REFERENCES [dbo].[Driver_] ([id_driver])
GO
ALTER TABLE [dbo].[driver_cat] CHECK CONSTRAINT [FK_driver_cat_Driver_]
GO
ALTER TABLE [dbo].[ExAuto]  WITH CHECK ADD  CONSTRAINT [FK_ExAuto_auto] FOREIGN KEY([id_auto])
REFERENCES [dbo].[auto] ([id_auto])
GO
ALTER TABLE [dbo].[ExAuto] CHECK CONSTRAINT [FK_ExAuto_auto]
GO
ALTER TABLE [dbo].[ExAuto]  WITH CHECK ADD  CONSTRAINT [FK_ExAuto_fuel] FOREIGN KEY([id_fuel])
REFERENCES [dbo].[fuel] ([id_fuel])
GO
ALTER TABLE [dbo].[ExAuto] CHECK CONSTRAINT [FK_ExAuto_fuel]
GO
ALTER TABLE [dbo].[loaders_order]  WITH CHECK ADD  CONSTRAINT [FK_loaders_order_staff] FOREIGN KEY([id_staff])
REFERENCES [dbo].[staff] ([id_staff])
GO
ALTER TABLE [dbo].[loaders_order] CHECK CONSTRAINT [FK_loaders_order_staff]
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_People] FOREIGN KEY([id_people])
REFERENCES [dbo].[People] ([id_people])
GO
ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_People]
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD  CONSTRAINT [FK_logins_user_group] FOREIGN KEY([id_user_group])
REFERENCES [dbo].[user_group] ([id_UG])
GO
ALTER TABLE [dbo].[logins] CHECK CONSTRAINT [FK_logins_user_group]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_cargo]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_client] FOREIGN KEY([id_client])
REFERENCES [dbo].[client] ([id_clients])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_client]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Driver_] FOREIGN KEY([id_driver])
REFERENCES [dbo].[Driver_] ([id_driver])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Driver_]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_ExAuto] FOREIGN KEY([id_exauto])
REFERENCES [dbo].[ExAuto] ([id_exauto])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_ExAuto]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_staff] FOREIGN KEY([id_manager])
REFERENCES [dbo].[staff] ([id_staff])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_staff]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_statusorder] FOREIGN KEY([id_statusorder])
REFERENCES [dbo].[statusorder] ([id_statusorder])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_statusorder]
GO
ALTER TABLE [dbo].[PreOrder_2]  WITH CHECK ADD  CONSTRAINT [FK_PreOrder_2_logins] FOREIGN KEY([id_login])
REFERENCES [dbo].[logins] ([id_login])
GO
ALTER TABLE [dbo].[PreOrder_2] CHECK CONSTRAINT [FK_PreOrder_2_logins]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_People] FOREIGN KEY([id_people])
REFERENCES [dbo].[People] ([id_people])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_People]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_post] FOREIGN KEY([id_post])
REFERENCES [dbo].[post] ([id_post])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_post]
GO
USE [master]
GO
ALTER DATABASE [logistic_services] SET  READ_WRITE 
GO
