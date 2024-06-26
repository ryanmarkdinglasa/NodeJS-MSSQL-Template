USE [master]
GO
/****** Object:  Database [Innosoft_TMS]    Script Date: 09/05/2024 10:02:12 pm ******/
CREATE DATABASE [Innosoft_TMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Innosoft_TMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Innosoft_TMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Innosoft_TMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Innosoft_TMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Innosoft_TMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Innosoft_TMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Innosoft_TMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Innosoft_TMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Innosoft_TMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Innosoft_TMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Innosoft_TMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Innosoft_TMS] SET  MULTI_USER 
GO
ALTER DATABASE [Innosoft_TMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Innosoft_TMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Innosoft_TMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Innosoft_TMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Innosoft_TMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Innosoft_TMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Innosoft_TMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [Innosoft_TMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Innosoft_TMS]
GO
/****** Object:  Table [dbo].[AccessRight]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessRight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_AccessRight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NULL,
	[TicketReviewId] [int] NULL,
	[Attachment] [nvarchar](255) NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Record] [int] NULL,
	[RecordTable] [nvarchar](50) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactPerson] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](50) NOT NULL,
	[LandlineNumber] [nvarchar](50) NULL,
	[DateSoftwareAcceptance] [datetime2](7) NOT NULL,
	[DateBCSRenewal] [datetime2](7) NOT NULL,
	[DateBCSExpiry] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceToken]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Tokens] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_DeviceToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[LinkedComponent] [nvarchar](255) NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[AccessRightId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetimeoffset](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 5) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketNumber] [nvarchar](50) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Caller] [nvarchar](50) NOT NULL,
	[Concern] [nvarchar](255) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AnsweredBy] [int] NOT NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](255) NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Severity] [nvarchar](50) NOT NULL,
	[AssignedBy] [int] NOT NULL,
	[Solution] [nvarchar](255) NOT NULL,
	[DoneDate] [datetime2](7) NULL,
	[IsReviewed] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketLine]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Action] [nvarchar](255) NULL,
	[DateCalled] [datetime2](7) NULL,
	[DateFinished] [datetime2](7) NULL,
 CONSTRAINT [PK_TicektLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketReview]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[TicketReviewNumber] [nvarchar](50) NOT NULL,
	[ReviewedBy] [int] NOT NULL,
	[Comments] [nvarchar](255) NULL,
	[SatisfactoryRate] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime2](7) NULL,
 CONSTRAINT [PK_TicketReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/05/2024 10:02:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[isDeactivated] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccessRight] ON 

INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1011, N'000001', N'ViewUser', N'Allow View User', 2, CAST(N'2024-03-18T11:34:10.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:34:10.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1012, N'000002', N'ViewAllUser', N'Allow View All User', 2, CAST(N'2024-03-18T11:34:22.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:34:22.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1013, N'000003', N'AddUser', N'Allow Add User', 2, CAST(N'2024-03-18T11:34:37.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:34:37.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1014, N'000004', N'EditUser', N'Allow Edit User', 2, CAST(N'2024-03-18T11:34:59.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:34:59.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1015, N'000005', N'DeleteUser', N'Allow Delete User', 2, CAST(N'2024-03-18T11:35:12.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:35:12.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1016, N'000006', N'DeleteAllUser', N'Allow Delete All User', 2, CAST(N'2024-03-18T11:35:22.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:35:22.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1017, N'000007', N'ViewRole', N'Allow View Role', 2, CAST(N'2024-03-18T11:36:41.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:36:41.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1018, N'000008', N'ViewAllRole', N'Allow View All Role', 2, CAST(N'2024-03-18T11:37:35.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:37:35.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1019, N'000009', N'AddRole', N'Allow Add Role', 2, CAST(N'2024-03-18T11:37:46.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:37:46.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1020, N'000010', N'EditRole', N'Allow Edit Role', 2, CAST(N'2024-03-18T11:37:59.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:37:59.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1021, N'000011', N'DeleteRole', N'Allow Delete Role', 2, CAST(N'2024-03-18T11:38:11.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:38:11.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1022, N'000012', N'DeleteAllRole', N'Allow Delete All Role', 2, CAST(N'2024-03-18T11:38:21.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:38:21.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1023, N'000013', N'ViewDepartment', N'Allow View Department', 2, CAST(N'2024-03-18T11:39:28.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:39:28.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1024, N'000014', N'ViewAllDepartment', N'Allow View All Department', 2, CAST(N'2024-03-18T11:39:35.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:39:35.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1025, N'000015', N'AddDepartment', N'Allow Add Department', 2, CAST(N'2024-03-18T11:39:46.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:39:46.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1026, N'000016', N'EditDepartment', N'Allow Edit Department', 2, CAST(N'2024-03-18T11:39:55.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:39:55.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1027, N'000017', N'DeleteDepartment', N'Allow Delete Department', 2, CAST(N'2024-03-18T11:40:05.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:40:05.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1028, N'000018', N'DeleteAllDepartment', N'Allow Delete All Department', 2, CAST(N'2024-03-18T11:40:15.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:40:15.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1029, N'000019', N'ViewClient', N'Allow View Client', 2, CAST(N'2024-03-18T11:40:39.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:41:34.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1030, N'000020', N'ViewAllClient', N'Allow View All Client', 2, CAST(N'2024-03-18T11:41:58.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:41:58.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1031, N'000021', N'AddClient', N'Allow Add Client', 2, CAST(N'2024-03-18T11:42:10.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:42:10.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1032, N'000022', N'EditClient', N'Allow Edit Client', 2, CAST(N'2024-03-18T11:42:19.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:42:19.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1033, N'000023', N'DeleteClient', N'Allow Delete Client', 2, CAST(N'2024-03-18T11:42:29.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:42:29.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1034, N'000024', N'DeleteAllClient', N'Allow Delete All Client', 2, CAST(N'2024-03-18T11:42:36.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:42:36.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1035, N'000025', N'ViewPermission', N'Allow View Permission', 2, CAST(N'2024-03-18T11:43:15.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:15.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1036, N'000026', N'ViewAllPermission', N'Allow View All Permission', 2, CAST(N'2024-03-18T11:43:24.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:24.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1037, N'000027', N'AddPermission', N'Allow Add Permission', 2, CAST(N'2024-03-18T11:43:34.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:34.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1038, N'000028', N'EditPermission', N'Allow Edit Permission', 2, CAST(N'2024-03-18T11:43:43.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:43.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1039, N'000029', N'DeletePermission', N'Allow Delete Permission', 2, CAST(N'2024-03-18T11:43:52.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:52.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1040, N'000030', N'DeleteAllPermission', N'Allow Delete All Permission', 2, CAST(N'2024-03-18T11:43:59.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:43:59.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1041, N'000031', N'ViewProduct', N'Allow View Product', 2, CAST(N'2024-03-18T11:44:23.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:44:23.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1042, N'000032', N'ViewAllProduct', N'Allow View All Product', 2, CAST(N'2024-03-18T11:44:29.0000000' AS DateTime2), 2, CAST(N'2024-03-18T11:44:29.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1043, N'000033', N'AddProduct', N'Allow Add Product', 2, CAST(N'2024-03-18T12:04:18.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:05:25.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1044, N'000034', N'EditProduct', N'Allow Edit Product', 2, CAST(N'2024-03-18T12:05:45.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:05:45.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1045, N'000035', N'DeleteProduct', N'Allow Delete Product', 2, CAST(N'2024-03-18T12:06:53.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:06:53.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1046, N'000036', N'DeleteAllProduct', N'Allow Delete All Product', 2, CAST(N'2024-03-18T12:07:01.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:07:01.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1047, N'000037', N'ViewTicket', N'Allow View Ticket', 2, CAST(N'2024-03-18T12:07:27.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:07:27.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1048, N'000038', N'ViewAllTicket', N'Allow View All Ticket', 2, CAST(N'2024-03-18T12:07:35.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:07:35.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1049, N'000039', N'AddTicket', N'Allow Add Ticket', 2, CAST(N'2024-03-18T12:07:48.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:07:48.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1050, N'000040', N'EditTicket', N'Allow Edit Ticket', 2, CAST(N'2024-03-18T12:07:56.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:07:56.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1051, N'000041', N'DeleteTicket', N'Allow Delete Ticket', 2, CAST(N'2024-03-18T12:08:07.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:08:07.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1055, N'000042', N'DeleteAllTicket', N'Allow Delete All Ticket', 2, CAST(N'2024-03-18T12:20:55.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:20:55.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1056, N'000043', N'ViewAccessRight', N'Allow View AccessRight', 2, CAST(N'2024-03-18T12:34:32.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:34:32.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1057, N'000044', N'ViewAllAccessRight', N'Allow View All AccessRight', 2, CAST(N'2024-03-18T12:34:42.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:34:42.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1058, N'000045', N'AddAccessRight', N'Allow Add AccessRight', 2, CAST(N'2024-03-18T12:35:00.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:35:00.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1059, N'000046', N'EditAccessRight', N'Allow Edit AccessRight', 2, CAST(N'2024-03-18T12:35:12.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:35:12.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1060, N'000047', N'DeleteAccessRight', N'Allow Delete AccessRight', 2, CAST(N'2024-03-18T12:35:22.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:35:22.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1061, N'000048', N'DeleteAllAccessRight', N'Allow Delete All AccessRight', 2, CAST(N'2024-03-18T12:35:31.0000000' AS DateTime2), 2, CAST(N'2024-03-18T12:35:31.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1064, N'000049', N'ViewAllTicketLine', N'Allow View All TicketLine', 2, CAST(N'2024-04-19T18:31:32.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:31:37.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1065, N'000050', N'ViewTicketLine', N'Allow View TicketLine', 2, CAST(N'2024-04-19T18:32:10.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:32:13.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1067, N'000051', N'AddTicketLine', N'Allow Add TicketLine', 2, CAST(N'2024-04-19T18:33:08.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:33:12.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1068, N'000052', N'EditTicketLine', N'Allow Edit TicketLine', 2, CAST(N'2024-04-19T18:33:43.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:33:48.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1070, N'000053', N'DeleteAllTicketLine', N'Allow Delete All TicketLine', 2, CAST(N'2024-04-19T18:34:22.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:34:26.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1071, N'000054', N'DeleteTicketLine', N'Allow Delete TicketLine', 2, CAST(N'2024-04-19T18:34:46.0000000' AS DateTime2), 2, CAST(N'2024-04-19T18:34:51.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1072, N'000055', N'ViewAllTicketData', N'get the ticket count', 3017, CAST(N'2024-05-02T15:58:14.0000000' AS DateTime2), 3017, CAST(N'2024-05-02T15:58:14.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1073, N'000056', N'ViewAllTicketDataById', N'get ticketdata per user', 3017, CAST(N'2024-05-02T15:58:34.0000000' AS DateTime2), 3017, CAST(N'2024-05-02T15:58:34.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1074, N'000057', N'ViewAllAuditTrail', N'View all audit trail', 6027, CAST(N'2024-05-04T12:30:50.0000000' AS DateTime2), 6027, CAST(N'2024-05-04T12:30:50.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1075, N'000058', N'DeleteAuditTrail', N'Deleting auditing trail', 6027, CAST(N'2024-05-04T12:31:03.0000000' AS DateTime2), 6027, CAST(N'2024-05-04T12:31:03.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2074, N'000059', N'ViewMonthlyTicketData', N'Get the monthly record of tickets', 3017, CAST(N'2024-05-09T21:07:37.0000000' AS DateTime2), 3017, CAST(N'2024-05-09T21:47:24.0000000' AS DateTime2))
INSERT [dbo].[AccessRight] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2075, N'000060', N'ViewAverageRate', N'Get the all average rate', 3017, CAST(N'2024-05-09T21:41:45.0000000' AS DateTime2), 3017, CAST(N'2024-05-09T21:41:45.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AccessRight] OFF
GO
SET IDENTITY_INSERT [dbo].[Attachment] ON 

INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (1, 3, NULL, N'1713844606960.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (18, 3, NULL, N'1713851245406.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (20, 3, NULL, N'1713852748574.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (35, 41, NULL, N'1714360379658.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (36, NULL, 9, N'1714362301178.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (39, NULL, 4, N'1714363413595.png')
INSERT [dbo].[Attachment] ([Id], [TicketId], [TicketReviewId], [Attachment]) VALUES (40, NULL, 4, N'1714363413598.png')
SET IDENTITY_INSERT [dbo].[Attachment] OFF
GO
SET IDENTITY_INSERT [dbo].[AuditTrail] ON 

INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1, 3017, N'AddTicket', 47, NULL, CAST(N'2024-04-30T23:43:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (8, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T13:11:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (9, 3017, N'DeleteRole', 1046, N'Role', CAST(N'2024-05-03T13:13:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (10, 3017, N'DeleteRole', 1048, N'Role', CAST(N'2024-05-03T13:21:41.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (11, 3017, N'DeleteRole', 1047, N'Role', CAST(N'2024-05-03T13:22:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (12, 3017, N'DeleteRole', 20, N'Role', CAST(N'2024-05-03T13:22:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (13, 3017, N'DeleteRole', 1050, N'Role', CAST(N'2024-05-03T14:23:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (14, 3017, N'DeleteRole', 21, N'Role', CAST(N'2024-05-03T14:23:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (15, 3017, N'DeleteRole', 22, N'Role', CAST(N'2024-05-03T14:23:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (16, 3017, N'DeleteRole', 15, N'Role', CAST(N'2024-05-03T14:31:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (17, 3017, N'DeleteRole', 1051, N'Role', CAST(N'2024-05-03T14:32:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (18, 3017, N'DeleteRole', 1055, N'Role', CAST(N'2024-05-03T14:41:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (19, 3017, N'DeleteRole', 1054, N'Role', CAST(N'2024-05-03T14:41:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (20, 3017, N'DeleteRole', 1053, N'Role', CAST(N'2024-05-03T14:41:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (21, 3017, N'DeleteRole', 1056, N'Role', CAST(N'2024-05-03T14:43:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (22, 3017, N'DeleteRole', 1057, N'Role', CAST(N'2024-05-03T15:10:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (23, 3017, N'DeleteRole', 1059, N'Role', CAST(N'2024-05-03T15:11:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (24, 3017, N'DeleteRole', 1058, N'Role', CAST(N'2024-05-03T15:26:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (25, 3017, N'DeleteRole', 1052, N'Role', CAST(N'2024-05-03T15:26:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (26, 3017, N'DeleteRole', 1062, N'Role', CAST(N'2024-05-03T19:12:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (27, 3017, N'DeleteRole', 1060, N'Role', CAST(N'2024-05-03T19:12:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (28, 3017, N'DeleteRole', 1063, N'Role', CAST(N'2024-05-03T20:01:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (29, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:09:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (30, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:09:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (31, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:09:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (32, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:10:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (33, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:10:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (34, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:10:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (35, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:10:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (36, 3017, N'DeleteRole', 1061, N'Role', CAST(N'2024-05-03T21:19:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (37, 3017, N'DeleteRole', 1066, N'Role', CAST(N'2024-05-03T21:19:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (38, 3017, N'DeleteRole', 1064, N'Role', CAST(N'2024-05-03T21:28:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (39, 3017, N'DeleteRole', 1067, N'Role', CAST(N'2024-05-03T21:28:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (40, 3017, N'EditUser', 3017, N'User', CAST(N'2024-05-03T21:33:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (41, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:33:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (42, 3017, N'DeleteRole', 1070, N'Role', CAST(N'2024-05-03T21:44:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (43, 3017, N'DeleteRole', 1065, N'Role', CAST(N'2024-05-03T21:45:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (44, 3017, N'EditUser', 6026, N'User', CAST(N'2024-05-03T21:52:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (45, 3017, N'DeleteRole', 1072, N'Role', CAST(N'2024-05-03T21:52:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (46, 3017, N'DeleteRole', 1069, N'Role', CAST(N'2024-05-03T21:54:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (47, 3017, N'DeleteRole', 1074, N'Role', CAST(N'2024-05-03T21:55:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (48, 3017, N'DeleteRole', 1075, N'Role', CAST(N'2024-05-03T21:55:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (49, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-03T22:00:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (50, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T22:00:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (51, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-03T22:00:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (52, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T22:00:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (53, 3017, N'DeleteRole', 1068, N'Role', CAST(N'2024-05-03T22:01:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (54, 3017, N'DeleteRole', 26, N'Role', CAST(N'2024-05-03T22:18:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (55, 3017, N'DeleteRole', 28, N'Role', CAST(N'2024-05-03T22:20:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (56, 3017, N'DeleteRole', 27, N'Role', CAST(N'2024-05-03T22:21:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (57, 3017, N'DeleteRole', 1030, N'Role', CAST(N'2024-05-03T22:36:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (58, 3017, N'DeleteRole', 1031, N'Role', CAST(N'2024-05-03T22:36:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (59, 3017, N'DeleteRole', 1036, N'Role', CAST(N'2024-05-03T22:40:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (60, 3017, N'DeleteRole', 1034, N'Role', CAST(N'2024-05-03T22:44:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (61, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T22:49:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (62, 3017, N'DeleteRole', 1037, N'Role', CAST(N'2024-05-03T22:51:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (63, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T22:51:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (64, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T22:51:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (65, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-03T23:01:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (66, 3017, N'DeleteRole', 52, N'Role', CAST(N'2024-05-03T23:17:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (67, 3017, N'DeleteRole', 51, N'Role', CAST(N'2024-05-03T23:19:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (68, 3017, N'ViewProduct', 1, N'Product', CAST(N'2024-05-03T23:19:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (69, 3017, N'DeleteRole', 1080, N'Role', CAST(N'2024-05-03T23:19:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (70, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:49:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (71, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:54:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (72, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:58:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (73, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:58:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (74, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:58:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (75, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:58:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (76, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:58:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (77, 3017, N'ViewDepartment', 3, N'Department', CAST(N'2024-05-03T23:58:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (78, 3017, N'ViewDepartment', 3, N'Department', CAST(N'2024-05-03T23:59:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (79, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:59:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (80, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:59:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (81, 3017, N'DeleteRole', 34, N'Role', CAST(N'2024-05-03T23:59:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (82, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-03T23:59:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (83, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:00:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (84, 3017, N'DeleteRole', 32, N'Role', CAST(N'2024-05-04T00:00:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (85, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:00:41.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (86, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:01:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (87, 3017, N'DeleteRole', 33, N'Role', CAST(N'2024-05-04T00:01:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (88, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:01:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (89, 3017, N'ViewDepartment', 3, N'Department', CAST(N'2024-05-04T00:01:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (90, 3017, N'ViewDepartment', 3, N'Department', CAST(N'2024-05-04T00:02:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (91, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:02:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (92, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:02:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (93, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:02:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (94, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:04:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (95, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:04:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (96, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:05:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (97, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:05:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (98, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:05:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (99, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:06:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (100, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:06:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (101, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:07:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (102, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:07:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (103, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:07:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (104, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:08:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (105, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:08:10.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (106, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:08:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (107, 3017, N'DeleteRole', 39, N'Role', CAST(N'2024-05-04T00:08:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (108, 3017, N'DeleteRole', 40, N'Role', CAST(N'2024-05-04T00:08:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (109, 3017, N'DeleteRole', 38, N'Role', CAST(N'2024-05-04T00:08:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (110, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:08:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (111, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:09:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (112, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:09:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (113, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:10:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (114, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:10:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (115, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:10:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (116, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:10:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (117, 3017, N'ViewDepartment', 1, N'Department', CAST(N'2024-05-04T00:10:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (118, 3017, N'ViewDepartment', 2, N'Department', CAST(N'2024-05-04T00:10:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (119, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:11:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (120, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:11:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (121, 3017, N'DeleteRole', 31, N'Role', CAST(N'2024-05-04T00:12:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (122, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:12:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (123, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:12:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (124, 3017, N'DeleteRole', 37, N'Role', CAST(N'2024-05-04T00:13:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (125, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:13:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (126, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:13:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (127, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:13:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (128, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:13:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (129, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:13:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (130, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:13:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (131, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:13:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (132, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:14:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (133, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:14:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (134, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:14:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (135, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (136, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:15:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (137, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (138, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (139, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:15:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (140, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (141, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (142, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (143, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:15:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (144, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:15:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (145, 3017, N'DeleteRole', 36, N'Role', CAST(N'2024-05-04T00:16:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (146, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:16:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (147, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (148, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (149, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:16:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (150, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (151, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (152, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:16:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (153, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (154, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:16:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (155, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:19:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (156, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:19:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (157, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:19:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (158, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:19:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (159, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:19:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (160, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:20:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (161, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:20:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (162, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:20:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (163, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:21:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (164, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:21:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (165, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:22:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (166, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:22:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (167, 3017, N'DeleteRole', 1079, N'Role', CAST(N'2024-05-04T00:22:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (168, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:22:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (169, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:22:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (170, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:23:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (171, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:23:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (172, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:23:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (173, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:23:34.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (174, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:24:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (175, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:24:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (176, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:24:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (177, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:24:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (178, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:24:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (179, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:24:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (180, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:24:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (181, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:24:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (182, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:25:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (183, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:25:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (184, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:26:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (185, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:26:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (186, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:27:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (187, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:28:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (188, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:28:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (189, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:28:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (190, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:28:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (191, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:28:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (192, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:28:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (193, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:28:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (194, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:29:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (195, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:29:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (196, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:29:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (197, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:29:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (198, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:29:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (199, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:29:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (200, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:30:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (201, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:30:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (202, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:30:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (203, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:30:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (204, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:30:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (205, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:30:59.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (206, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:31:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (207, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:31:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (208, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:31:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (209, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:31:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (210, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:33:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (211, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:36:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (212, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:36:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (213, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:36:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (214, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:36:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (215, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:36:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (216, 3017, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T00:36:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (217, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T00:36:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (218, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:36:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (219, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:43:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (220, 3017, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T00:43:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (221, 3017, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T00:43:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (222, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T00:44:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (223, 3017, N'AddUser', 6027, N'User', CAST(N'2024-05-04T00:46:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (224, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:39:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (225, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:39:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (226, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:39:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (227, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:41:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (228, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:42:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (229, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:42:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (230, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:42:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (231, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:42:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (232, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T01:43:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (233, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T01:46:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (234, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:46:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (235, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:46:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (236, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:46:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (237, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:46:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (238, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:46:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (239, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:46:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (240, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:46:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (241, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:47:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (242, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:52:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (243, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:53:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (244, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:54:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (245, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:54:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (246, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:54:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (247, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:55:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (248, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T01:55:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (249, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:55:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (250, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:56:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (251, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T01:57:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (252, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:35:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (253, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:35:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (254, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:36:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (255, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:36:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (256, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:36:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (257, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:36:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (258, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:36:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (259, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:36:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (260, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:36:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (261, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:36:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (262, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:36:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (263, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (264, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (265, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (266, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (267, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (268, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (269, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (270, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (271, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (272, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (273, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (274, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (275, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (276, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (277, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (278, 6027, N'AddPermission', 1029, N'Permission', CAST(N'2024-05-04T08:37:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (279, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (280, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (281, 6027, N'ViewClient', 2, N'Client', CAST(N'2024-05-04T08:37:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (282, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (283, 6027, N'ViewClient', 1, N'Client', CAST(N'2024-05-04T08:37:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (284, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (285, 6027, N'ViewClient', 2, N'Client', CAST(N'2024-05-04T08:37:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (286, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (287, 6027, N'ViewClient', 1, N'Client', CAST(N'2024-05-04T08:37:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (288, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (289, 6027, N'ViewClient', 2, N'Client', CAST(N'2024-05-04T08:37:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (290, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:37:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (291, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:37:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (292, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:37:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (293, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:37:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (294, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (295, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (296, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:37:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (297, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:37:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (298, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (299, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:37:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (300, 6027, N'AddPermission', 1027, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (301, 6027, N'AddPermission', 1032, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (302, 6027, N'AddPermission', 1044, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (303, 6027, N'AddPermission', 1059, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (304, 6027, N'AddPermission', 1045, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (305, 6027, N'AddPermission', 1021, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (306, 6027, N'AddPermission', 1026, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (307, 6027, N'AddPermission', 1024, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (308, 6027, N'AddPermission', 1020, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (309, 6027, N'AddPermission', 1042, N'Permission', CAST(N'2024-05-04T08:38:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (310, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:38:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (311, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:38:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (312, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:38:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (313, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:38:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (314, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:38:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (315, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:38:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (316, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:38:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (317, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:38:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (318, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:38:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (319, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:38:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (320, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:41:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (321, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:43:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (322, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:43:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (323, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:43:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (324, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T08:43:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (325, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T08:43:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (326, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T08:43:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (327, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:43:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (328, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:43:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (329, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:44:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (330, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:44:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (331, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:44:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (332, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:44:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (333, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:44:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (334, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:45:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (335, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (336, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (337, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (338, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (339, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (340, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (341, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:46:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (342, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (343, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (344, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (345, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (346, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (347, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (348, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:47:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (349, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:48:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (350, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:48:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (351, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:48:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (352, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:48:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (353, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:49:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (354, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:50:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (355, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:50:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (356, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:51:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (357, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:51:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (358, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:51:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (359, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:52:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (360, 6027, N'DeleteRole', 56, N'Role', CAST(N'2024-05-04T08:52:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (361, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:52:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (362, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:52:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (363, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:52:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (364, 6027, N'DeleteRole', 58, N'Role', CAST(N'2024-05-04T08:53:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (365, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:53:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (366, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:53:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (367, 6027, N'DeleteRole', 57, N'Role', CAST(N'2024-05-04T08:54:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (368, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T08:54:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (369, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:54:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (370, 6027, N'ViewUser', 3020, N'User', CAST(N'2024-05-04T08:54:34.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (371, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:54:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (372, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:54:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (373, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T08:54:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (374, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:54:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (375, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T08:54:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (376, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T08:54:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (377, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:54:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (378, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:54:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (379, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:54:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (380, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:54:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (381, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:54:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (382, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:54:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (383, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:54:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (384, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:55:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (385, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T08:55:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (386, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T08:55:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (387, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:55:41.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (388, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:57:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (389, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:58:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (390, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T08:59:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (391, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:00:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (392, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:00:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (393, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:00:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (394, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:00:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (395, 6027, N'DeleteRole', 86, N'Role', CAST(N'2024-05-04T09:01:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (396, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:01:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (397, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:01:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (398, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:02:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (399, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:02:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (400, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:02:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (401, 6027, N'DeleteRole', 88, N'Role', CAST(N'2024-05-04T09:03:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (402, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:03:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (403, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:03:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (404, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:03:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (405, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:03:47.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (406, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:03:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (407, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:03:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (408, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:03:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (409, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:03:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (410, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:03:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (411, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:03:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (412, 6027, N'ViewUser', 3017, N'User', CAST(N'2024-05-04T09:03:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (413, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:03:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (414, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (415, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:04:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (416, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (417, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T09:04:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (418, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (419, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (420, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (421, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (422, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (423, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (424, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (425, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (426, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (427, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (428, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (429, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:04:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (430, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:04:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (431, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:04:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (432, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (433, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (434, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:04:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (435, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (436, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T09:04:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (437, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (438, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:04:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (439, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:04:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (440, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (441, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:04:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (442, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:04:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (443, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:05:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (444, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:05:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (445, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:05:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (446, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (447, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:06:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (448, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (449, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T09:06:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (450, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (451, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (452, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (453, 6027, N'AddPermission', 1039, N'Permission', CAST(N'2024-05-04T09:06:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (454, 6027, N'AddPermission', 1037, N'Permission', CAST(N'2024-05-04T09:06:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (455, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (456, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:06:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (457, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (458, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (459, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T09:06:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (460, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (461, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (462, 6027, N'DeleteRole', 85, N'Role', CAST(N'2024-05-04T09:06:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (463, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (464, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (465, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:06:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (466, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (467, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:06:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (468, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:06:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (469, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:06:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (470, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:06:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (471, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:06:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (472, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:01.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (473, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (474, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (475, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:07:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (476, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (477, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (478, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (479, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:07:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (480, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (481, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (482, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (483, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (484, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:07:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (485, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (486, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:08:41.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (487, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (488, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:08:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (489, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (490, 6027, N'EditUser', 6027, N'User', CAST(N'2024-05-04T09:08:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (491, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (492, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:08:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (493, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (494, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:08:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (495, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:08:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (496, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:09:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (497, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:09:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (498, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:09:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (499, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:09:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (500, 6027, N'ViewUser', 6027, N'User', CAST(N'2024-05-04T09:09:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (501, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:09:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (502, 6027, N'ViewUser', 3017, N'User', CAST(N'2024-05-04T09:09:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (503, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:09:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (504, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:09:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (505, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:09:33.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (506, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:09:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (507, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:09:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (508, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:10:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (509, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:10:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (510, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:10:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (511, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:10:26.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (512, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:10:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (513, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:12:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (514, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:21:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (515, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:22:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (516, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:22:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (517, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:22:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (518, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:22:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (519, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:22:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (520, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:22:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (521, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:23:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (522, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:25:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (523, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:25:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (524, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:25:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (525, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:25:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (526, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:25:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (527, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:25:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (528, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T09:25:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (529, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:26:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (530, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:26:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (531, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:26:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (532, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:26:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (533, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:26:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (534, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:26:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (535, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:26:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (536, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:26:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (537, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:26:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (538, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:26:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (539, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:26:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (540, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:26:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (541, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:29:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (542, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:29:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (543, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:29:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (544, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:29:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (545, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:29:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (546, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:30:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (547, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:30:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (548, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:30:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (549, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:30:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (550, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:30:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (551, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:30:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (552, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:30:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (553, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:30:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (554, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:30:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (555, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:30:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (556, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:30:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (557, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:30:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (558, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:30:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (559, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:30:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (560, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:30:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (561, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:30:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (562, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:30:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (563, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:30:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (564, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:30:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (565, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:30:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (566, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:30:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (567, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:30:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (568, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:30:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (569, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:30:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (570, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:30:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (571, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:30:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (572, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:30:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (573, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:32:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (574, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:32:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (575, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:32:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (576, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:32:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (577, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:32:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (578, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:32:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (579, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T09:32:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (580, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:32:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (581, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T09:32:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (582, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:32:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (583, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T09:34:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (584, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T09:34:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (585, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T09:34:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (586, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T09:34:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (587, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T09:34:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (588, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:23:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (589, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:23:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (590, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:23:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (591, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:23:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (592, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T12:23:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (594, 6027, N'ViewAccessRight', 1058, N'AccessRight', CAST(N'2024-05-04T12:24:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (595, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:27:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (596, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:27:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (597, 6027, N'AddRole', 9, N'Role', CAST(N'2024-05-04T12:27:46.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (598, 6027, N'DeleteRole', 9, N'Role', CAST(N'2024-05-04T12:27:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (599, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:27:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (600, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:27:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (601, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:28:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (602, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T12:30:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (603, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T12:30:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (604, 6027, N'AddAccessRight', 1074, N'AccessRight', CAST(N'2024-05-04T12:30:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (605, 6027, N'AddAccessRight', 1075, N'AccessRight', CAST(N'2024-05-04T12:31:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (606, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:31:04.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (607, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T12:31:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (608, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T12:31:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (609, 6027, N'AddPermission', 1074, N'Permission', CAST(N'2024-05-04T12:31:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (610, 6027, N'AddPermission', 1075, N'Permission', CAST(N'2024-05-04T12:31:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (611, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T12:31:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (612, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:34:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (613, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:34:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (614, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:35:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (615, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:35:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (616, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T12:35:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (617, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T12:35:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (618, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T12:35:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (619, 6027, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-04T12:35:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (620, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T12:35:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (621, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:35:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (622, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T12:35:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (623, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:35:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (624, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T12:35:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (625, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T12:35:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (626, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T12:35:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (627, 6027, N'DeleteRole', 1071, N'Role', CAST(N'2024-05-04T12:35:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (628, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T13:46:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (629, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T13:46:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (630, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T13:46:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (631, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T13:46:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (632, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:46:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (633, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T13:46:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (634, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:46:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (635, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T13:46:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (636, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:46:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (637, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T13:46:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (638, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-04T13:46:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (639, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T13:46:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (640, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T13:47:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (641, 6027, N'DeleteRole', 1102, N'Role', CAST(N'2024-05-04T13:47:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (642, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T13:47:09.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (643, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-04T13:47:10.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (644, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T13:47:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (645, 6027, N'ViewRole', NULL, N'Role', CAST(N'2024-05-04T13:47:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (646, 6027, N'AddPermission', 1050, N'Permission', CAST(N'2024-05-04T13:47:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (647, 6027, N'AddPermission', 1072, N'Permission', CAST(N'2024-05-04T13:47:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (648, 6027, N'AddPermission', 1051, N'Permission', CAST(N'2024-05-04T13:47:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (649, 6027, N'AddPermission', 1074, N'Permission', CAST(N'2024-05-04T13:47:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (650, 6027, N'AddPermission', 1049, N'Permission', CAST(N'2024-05-04T13:47:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (651, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:47:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (652, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T13:48:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (653, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-04T13:48:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (654, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T13:48:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (655, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (656, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T13:51:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (657, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (658, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-04T13:51:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (659, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (660, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:51:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (661, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:51:39.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (662, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (663, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (664, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:44.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (665, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:47.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (666, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (667, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:51:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (668, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:51:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (669, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:51:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (670, 6027, N'EditTicket', 55, N'Ticket', CAST(N'2024-05-04T13:52:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (671, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:53:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (672, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:53:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (673, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:53:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (674, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:53:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (675, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:53:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (676, 6027, N'DeleteTicket', 2, N'Ticket', CAST(N'2024-05-04T13:53:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (677, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T13:54:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (678, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:54:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (679, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-04T13:54:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (680, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:54:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (681, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:54:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (682, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:54:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (683, 6027, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-04T13:54:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (684, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:54:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (685, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T13:55:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (686, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-04T14:55:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1224, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:11:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1225, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T20:11:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1226, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:11:08.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1227, 3017, N'EditUser', 2, N'User', CAST(N'2024-05-09T20:11:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1228, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:12:00.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1229, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T20:12:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1230, 2, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:12:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1231, 2, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T20:12:22.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1232, 2, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T20:12:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1233, 2, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:12:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1234, 2, N'EditUser', 3017, N'User', CAST(N'2024-05-09T20:12:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1235, 2, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:12:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1236, 2, N'Logout', NULL, NULL, CAST(N'2024-05-09T20:12:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1237, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:12:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1238, 3017, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T20:16:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1239, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-09T20:16:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1240, 3017, N'DeleteClient', 1, N'Client', CAST(N'2024-05-09T20:16:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1241, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T20:21:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1242, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T20:21:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1243, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:21:53.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1244, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T20:21:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1245, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:28:15.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1246, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T20:28:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1247, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T20:28:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1248, 6027, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T20:28:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1249, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:37:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1250, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T20:37:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1251, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:37:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1252, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T20:37:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1253, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:37:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1254, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:38:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1255, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:38:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1256, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T20:41:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1257, 6027, N'Logout', NULL, NULL, CAST(N'2024-05-09T20:58:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1258, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:07:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1259, 3017, N'AddAccessRight', 2074, N'AccessRight', CAST(N'2024-05-09T21:07:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1260, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:09:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1261, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:13:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1262, 3017, N'EditAccessRight', 2074, N'AccessRight', CAST(N'2024-05-09T21:13:29.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1263, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:18:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1264, 3017, N'EditUser', 6027, N'User', CAST(N'2024-05-09T21:18:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1265, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:18:19.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1266, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:18:21.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1267, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:26:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1268, 6027, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:27:50.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1269, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:28:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1270, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:28:13.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1271, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:28:14.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1272, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:29:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1273, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:29:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1274, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:29:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1275, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:31:07.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1276, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:32:17.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1277, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:32:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1278, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:32:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1279, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:32:32.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1280, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:32:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1281, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:32:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1282, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:32:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1283, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:32:35.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1284, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:32:36.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1285, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:32:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1286, 3017, N'EditUser', 3017, N'User', CAST(N'2024-05-09T21:32:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1287, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:32:43.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1288, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:41:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1289, 3017, N'AddAccessRight', 2075, N'AccessRight', CAST(N'2024-05-09T21:41:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1290, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:41:52.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1291, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:41:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1292, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:42:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1293, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:47:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1294, 3017, N'EditAccessRight', 2074, N'AccessRight', CAST(N'2024-05-09T21:47:24.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1295, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:47:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1296, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:47:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1297, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:47:27.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1298, 3017, N'ViewRole', NULL, N'Role', CAST(N'2024-05-09T21:47:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1299, 3017, N'ViewRole', NULL, N'Role', CAST(N'2024-05-09T21:47:30.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1300, 3017, N'AddPermission', 2075, N'Permission', CAST(N'2024-05-09T21:47:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1301, 3017, N'AddPermission', 2074, N'Permission', CAST(N'2024-05-09T21:47:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1302, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:47:45.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1303, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:48:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1304, 6027, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:48:03.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1305, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:48:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1306, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:48:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1307, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T21:48:04.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1308, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-09T21:48:05.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1309, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:48:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1310, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:48:16.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1311, 6027, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:50:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1312, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:50:23.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1313, 3017, N'ViewUser', 6027, N'User', CAST(N'2024-05-09T21:50:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1314, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:50:25.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1315, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:50:28.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1316, 3017, N'DeleteRole', 1073, N'Role', CAST(N'2024-05-09T21:50:37.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1317, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:50:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1318, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:50:41.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1319, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:51:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1320, 3017, N'ViewRole', NULL, N'Role', CAST(N'2024-05-09T21:51:38.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1321, 3017, N'ViewRole', NULL, N'Role', CAST(N'2024-05-09T21:51:40.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1322, 3017, N'AddPermission', 1011, N'Permission', CAST(N'2024-05-09T21:51:42.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1323, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:52:12.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1324, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:52:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1325, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:52:53.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1326, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:52:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1327, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:53:11.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1328, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:53:48.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1329, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:53:49.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1330, 3017, N'ViewRole', NULL, N'Role', CAST(N'2024-05-09T21:53:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1331, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:53:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1332, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:53:57.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1333, 3017, N'EditUser', 6027, N'User', CAST(N'2024-05-09T21:54:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1334, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:54:02.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1335, 3017, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:54:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1336, 6027, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T21:54:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1337, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:54:31.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1338, 6027, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:55:18.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1339, 6027, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:55:20.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1340, 6027, N'ViewAllDepartment', NULL, N'Department', CAST(N'2024-05-09T21:56:06.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1341, 6027, N'Logout', NULL, NULL, CAST(N'2024-05-09T21:56:33.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1342, 3017, N'ViewAllUser', NULL, N'User', CAST(N'2024-05-09T21:56:51.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1343, 3017, N'ViewAllRole', NULL, N'Role', CAST(N'2024-05-09T21:56:53.0000000' AS DateTime2))
GO
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1344, 3017, N'ViewAllAccessRight', NULL, N'AccessRight', CAST(N'2024-05-09T21:56:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1345, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:56:54.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1346, 3017, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T21:56:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1347, 3017, N'ViewAllClient', NULL, N'Client', CAST(N'2024-05-09T21:56:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1348, 3017, N'ViewAllProduct', NULL, N'Product', CAST(N'2024-05-09T21:56:56.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1349, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:57:55.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1350, 3017, N'ViewAllTicket', NULL, N'Ticket', CAST(N'2024-05-09T21:57:58.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1351, 3017, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-09T21:57:59.0000000' AS DateTime2))
INSERT [dbo].[AuditTrail] ([Id], [UserId], [Action], [Record], [RecordTable], [DateCreated]) VALUES (1352, 3017, N'ViewAllTicketLine', NULL, N'TicketLine', CAST(N'2024-05-09T21:57:59.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AuditTrail] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Code], [Name], [Address], [Email], [ContactPerson], [MobileNumber], [LandlineNumber], [DateSoftwareAcceptance], [DateBCSRenewal], [DateBCSExpiry], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2, N'000002', N'dela', N'juan cebu', N'juan@gmail.com', N'iyang mama', N'091231231', N'09123123', CAST(N'2024-03-19T22:32:13.0000000' AS DateTime2), CAST(N'2024-03-19T22:32:16.0000000' AS DateTime2), CAST(N'2024-04-17T22:32:19.0000000' AS DateTime2), 3017, CAST(N'2024-03-19T22:32:28.0000000' AS DateTime2), 3017, CAST(N'2024-03-19T22:32:33.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1, N'000001', N'Customer Support', N'Assist and Guide Customers', 2, CAST(N'2024-02-25T19:53:27.000' AS DateTime), 2, CAST(N'2024-03-11T20:20:33.000' AS DateTime))
INSERT [dbo].[Department] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2, N'000002', N'IT', N'IT Department', 2, CAST(N'2024-02-25T19:54:05.000' AS DateTime), 2, CAST(N'2024-03-11T20:20:36.000' AS DateTime))
INSERT [dbo].[Department] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (3, N'000003', N'Human Resources', N'Human Resources Department', 2, CAST(N'2024-02-25T19:54:21.000' AS DateTime), 2, CAST(N'2024-03-11T20:20:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [UserId], [Description], [LinkedComponent], [Status], [DateCreated], [DateUpdated]) VALUES (1, 2, N'HelloWorld', N'/notification', 1, CAST(N'2024-04-17T09:08:59.000' AS DateTime), NULL)
INSERT [dbo].[Notification] ([Id], [UserId], [Description], [LinkedComponent], [Status], [DateCreated], [DateUpdated]) VALUES (2, 2, N'HelloWorld', N'/notification', 1, CAST(N'2024-04-17T09:09:15.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (23, N'000007', 5, 1016, 2, CAST(N'2024-03-18T12:23:32.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:23:32.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (25, N'000009', 5, 1018, 2, CAST(N'2024-03-18T12:23:40.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:23:40.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (29, N'000013', 5, 1022, 2, CAST(N'2024-03-18T12:23:57.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:23:57.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (30, N'000014', 5, 1023, 2, CAST(N'2024-03-18T12:24:00.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:24:00.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (35, N'000019', 5, 1028, 2, CAST(N'2024-03-18T12:24:19.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:24:19.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (41, N'000025', 5, 1034, 2, CAST(N'2024-03-18T12:24:46.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:24:46.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (42, N'000026', 5, 1035, 2, CAST(N'2024-03-18T12:24:50.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:24:50.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (43, N'000027', 5, 1036, 2, CAST(N'2024-03-18T12:24:55.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:24:55.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (44, N'000028', 5, 1037, 2, CAST(N'2024-03-18T12:25:00.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:00.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (45, N'000029', 5, 1038, 2, CAST(N'2024-03-18T12:25:04.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:04.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (46, N'000030', 5, 1039, 2, CAST(N'2024-03-18T12:25:08.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:08.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (47, N'000031', 5, 1040, 2, CAST(N'2024-03-18T12:25:14.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:14.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (50, N'000034', 5, 1043, 2, CAST(N'2024-03-18T12:25:23.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:23.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (53, N'000037', 5, 1046, 2, CAST(N'2024-03-18T12:25:34.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:34.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (54, N'000038', 5, 1047, 2, CAST(N'2024-03-18T12:25:38.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:38.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (55, N'000039', 5, 1048, 2, CAST(N'2024-03-18T12:25:43.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:25:43.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (59, N'000043', 5, 1055, 2, CAST(N'2024-03-18T12:26:06.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:26:06.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (60, N'000044', 7, 1011, 2, CAST(N'2024-03-18T12:27:36.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (61, N'000045', 7, 1012, 2, CAST(N'2024-03-18T12:27:40.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:40.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (62, N'000046', 7, 1013, 2, CAST(N'2024-03-18T12:27:44.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:44.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (63, N'000047', 7, 1014, 2, CAST(N'2024-03-18T12:27:48.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:48.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (64, N'000048', 7, 1015, 2, CAST(N'2024-03-18T12:27:51.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:51.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (65, N'000049', 7, 1016, 2, CAST(N'2024-03-18T12:27:55.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:55.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (66, N'000050', 7, 1017, 2, CAST(N'2024-03-18T12:27:59.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:27:59.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (67, N'000051', 7, 1018, 2, CAST(N'2024-03-18T12:28:03.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:03.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (68, N'000052', 7, 1019, 2, CAST(N'2024-03-18T12:28:06.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:06.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (69, N'000053', 7, 1020, 2, CAST(N'2024-03-18T12:28:11.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:11.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (70, N'000054', 7, 1021, 2, CAST(N'2024-03-18T12:28:15.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:15.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (71, N'000055', 7, 1022, 2, CAST(N'2024-03-18T12:28:18.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:18.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (72, N'000056', 7, 1023, 2, CAST(N'2024-03-18T12:28:22.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:22.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (73, N'000057', 7, 1024, 2, CAST(N'2024-03-18T12:28:25.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:25.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (74, N'000058', 7, 1025, 2, CAST(N'2024-03-18T12:28:28.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:28.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (75, N'000059', 7, 1026, 2, CAST(N'2024-03-18T12:28:32.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:32.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (76, N'000060', 7, 1027, 2, CAST(N'2024-03-18T12:28:36.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (77, N'000061', 7, 1028, 2, CAST(N'2024-03-18T12:28:40.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:40.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (78, N'000062', 7, 1029, 2, CAST(N'2024-03-18T12:28:43.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:43.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (79, N'000063', 7, 1030, 2, CAST(N'2024-03-18T12:28:48.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:48.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (80, N'000064', 7, 1031, 2, CAST(N'2024-03-18T12:28:52.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:52.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (81, N'000065', 7, 1032, 2, CAST(N'2024-03-18T12:28:55.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:55.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (82, N'000066', 7, 1033, 2, CAST(N'2024-03-18T12:28:59.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:28:59.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (83, N'000067', 7, 1034, 2, CAST(N'2024-03-18T12:29:03.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:03.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (84, N'000068', 7, 1035, 2, CAST(N'2024-03-18T12:29:07.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (87, N'000071', 7, 1038, 2, CAST(N'2024-03-18T12:29:20.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:20.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (89, N'000073', 7, 1040, 2, CAST(N'2024-03-18T12:29:28.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:28.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (90, N'000074', 7, 1041, 2, CAST(N'2024-03-18T12:29:31.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:31.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (91, N'000075', 7, 1042, 2, CAST(N'2024-03-18T12:29:34.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:34.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (92, N'000076', 7, 1043, 2, CAST(N'2024-03-18T12:29:38.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:38.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (93, N'000077', 7, 1044, 2, CAST(N'2024-03-18T12:29:41.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:41.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (94, N'000078', 7, 1045, 2, CAST(N'2024-03-18T12:29:44.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:44.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (95, N'000079', 7, 1046, 2, CAST(N'2024-03-18T12:29:47.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:47.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (96, N'000080', 7, 1047, 2, CAST(N'2024-03-18T12:29:50.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:50.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (97, N'000081', 7, 1048, 2, CAST(N'2024-03-18T12:29:55.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:55.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (98, N'000082', 7, 1049, 2, CAST(N'2024-03-18T12:29:58.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:29:58.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (99, N'000083', 7, 1050, 2, CAST(N'2024-03-18T12:30:04.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:30:04.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (100, N'000084', 7, 1051, 2, CAST(N'2024-03-18T12:30:07.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-18T12:30:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1018, N'000085', 7, 1055, 2, CAST(N'2024-03-19T12:03:50.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-03-19T12:03:50.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1021, N'000086', 7, 1064, 2, CAST(N'2024-04-19T18:37:21.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:37:27.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1022, N'000087', 7, 1065, 2, CAST(N'2024-04-19T18:37:50.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:37:54.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1023, N'000088', 7, 1067, 2, CAST(N'2024-04-19T18:38:46.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:38:51.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1024, N'000089', 7, 1068, 2, CAST(N'2024-04-19T18:39:13.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:39:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1025, N'000090', 7, 1070, 2, CAST(N'2024-04-19T18:39:36.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:39:39.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1026, N'000091', 7, 1071, 2, CAST(N'2024-04-19T18:39:57.0000000+00:00' AS DateTimeOffset), 2, CAST(N'2024-04-19T18:39:58.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1028, N'000093', 5, 1058, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1029, N'000094', 5, 1067, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1032, N'000097', 5, 1070, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1033, N'000098', 5, 1071, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1035, N'000100', 5, 1068, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1038, N'000103', 5, 1057, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1039, N'000104', 5, 1064, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1040, N'000105', 5, 1065, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1041, N'000106', 5, 1041, 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:57:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1043, N'000108', 5, 1073, 3017, CAST(N'2024-05-02T07:58:43.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T07:58:43.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1044, N'000109', 5, 1017, 3017, CAST(N'2024-05-02T08:11:31.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-02T08:11:31.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1049, N'000110', 5, 1012, 3017, CAST(N'2024-05-03T05:22:42.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T05:22:42.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1076, N'000124', 5, 1015, 3017, CAST(N'2024-05-03T13:56:13.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T13:56:13.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1077, N'000125', 5, 1014, 3017, CAST(N'2024-05-03T13:56:13.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T13:56:13.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1078, N'000126', 5, 1056, 3017, CAST(N'2024-05-03T14:42:56.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T14:42:56.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1081, N'000127', 5, 1030, 3017, CAST(N'2024-05-03T16:30:57.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:30:57.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1082, N'000128', 5, 1031, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1083, N'000129', 5, 1025, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1084, N'000130', 5, 1019, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1085, N'000131', 5, 1013, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1086, N'000132', 5, 1060, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1087, N'000133', 5, 1061, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1088, N'000134', 5, 1033, 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-03T16:45:33.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1089, N'000135', 5, 1029, 6027, CAST(N'2024-05-04T00:37:36.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:37:36.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1090, N'000136', 5, 1027, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1091, N'000137', 5, 1045, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1092, N'000138', 5, 1021, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1093, N'000139', 5, 1059, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1094, N'000140', 5, 1032, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1095, N'000141', 5, 1026, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1096, N'000142', 5, 1044, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1097, N'000143', 5, 1020, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1098, N'000144', 5, 1042, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1099, N'000145', 5, 1024, 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T00:38:07.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1100, N'000146', 7, 1037, 6027, CAST(N'2024-05-04T01:06:24.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T01:06:24.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1101, N'000147', 7, 1039, 6027, CAST(N'2024-05-04T01:06:24.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T01:06:24.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1103, N'000149', 5, 1075, 6027, CAST(N'2024-05-04T04:31:13.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T04:31:13.0000000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1104, N'000150', 5, 1072, 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1105, N'000151', 5, 1074, 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1106, N'000152', 5, 1050, 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1107, N'000153', 5, 1051, 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1108, N'000154', 5, 1049, 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset), 6027, CAST(N'2024-05-04T05:47:17.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2089, N'000155', 5, 2075, 3017, CAST(N'2024-05-09T13:47:32.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-09T13:47:32.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2090, N'000156', 5, 2074, 3017, CAST(N'2024-05-09T13:47:32.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-09T13:47:32.0000000+00:00' AS DateTimeOffset))
INSERT [dbo].[Permission] ([Id], [Code], [RoleId], [AccessRightId], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2091, N'000157', 5, 1011, 3017, CAST(N'2024-05-09T13:51:42.0000000+00:00' AS DateTimeOffset), 3017, CAST(N'2024-05-09T13:51:42.0000000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [Category], [Price], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (1, N'000001', N'POS', N'Point of Sale', N'POS', CAST(100.20000 AS Decimal(18, 5)), 2, CAST(N'2024-03-14T12:17:17.0000000' AS DateTime2), 2, CAST(N'2024-03-14T12:17:17.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (5, N'000001', N'Master Admin', N'Master Administrator role', 2, CAST(N'2024-02-25T19:48:41.000' AS DateTime), 2, CAST(N'2024-03-11T20:17:38.000' AS DateTime))
INSERT [dbo].[Role] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (7, N'000003', N'Admin', N'Administrator role', 2, CAST(N'2024-02-25T19:49:29.000' AS DateTime), 2, CAST(N'2024-03-11T20:17:51.000' AS DateTime))
INSERT [dbo].[Role] ([Id], [Code], [Name], [Description], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (8, N'000004', N'User', N'User role', 2, CAST(N'2024-02-25T19:49:49.000' AS DateTime), 2, CAST(N'2024-03-14T13:59:01.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([Id], [TicketNumber], [ClientId], [Caller], [Concern], [ProductId], [AnsweredBy], [Status], [Remarks], [Category], [Severity], [AssignedBy], [Solution], [DoneDate], [IsReviewed], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (3, N'20240423-000002', 2, N'sa', N'sa', 1, 3020, 0, N'ddd', N'Software Bug', N'High (3hrs. resolution)', 3017, N'dddd', CAST(N'2024-04-23T03:56:46.5780000' AS DateTime2), 1, 3017, CAST(N'2024-04-23T11:56:46.0000000' AS DateTime2), 3017, CAST(N'2024-04-23T18:23:29.0000000' AS DateTime2))
INSERT [dbo].[Ticket] ([Id], [TicketNumber], [ClientId], [Caller], [Concern], [ProductId], [AnsweredBy], [Status], [Remarks], [Category], [Severity], [AssignedBy], [Solution], [DoneDate], [IsReviewed], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (41, N'20240429-000004', 2, N'asdf', N'sss', 1, 3017, 1, N'asdf', N'Software Bug', N'High (3hrs. resolution)', 3017, N'dd', CAST(N'2024-04-30T23:06:43.3330000' AS DateTime2), 1, 3017, CAST(N'2024-04-29T11:12:59.0000000' AS DateTime2), 3017, CAST(N'2024-04-30T23:06:43.0000000' AS DateTime2))
INSERT [dbo].[Ticket] ([Id], [TicketNumber], [ClientId], [Caller], [Concern], [ProductId], [AnsweredBy], [Status], [Remarks], [Category], [Severity], [AssignedBy], [Solution], [DoneDate], [IsReviewed], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (45, N'20240430-000005', 2, N'sdf', N'sdf', 1, 3017, 0, N'sdf', N'New Installation', N'Moderate (1day resolution)', 3020, N'sdf', CAST(N'2024-04-30T15:39:10.2760000' AS DateTime2), 0, 3017, CAST(N'2024-04-30T23:39:10.0000000' AS DateTime2), 3017, CAST(N'2024-04-30T23:39:10.0000000' AS DateTime2))
INSERT [dbo].[Ticket] ([Id], [TicketNumber], [ClientId], [Caller], [Concern], [ProductId], [AnsweredBy], [Status], [Remarks], [Category], [Severity], [AssignedBy], [Solution], [DoneDate], [IsReviewed], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (47, N'20240430-000007', 2, N'asdf', N'asdf', 1, 3017, 0, N'asdf', N'New Installation', N'Moderate (1day resolution)', 3020, N'asdf', CAST(N'2024-04-30T15:43:56.2040000' AS DateTime2), 1, 3017, CAST(N'2024-04-30T23:43:56.0000000' AS DateTime2), 3017, CAST(N'2024-05-09T20:38:21.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketLine] ON 

INSERT [dbo].[TicketLine] ([Id], [TicketId], [Action], [DateCalled], [DateFinished]) VALUES (1, 3, N'wawaaa', CAST(N'2024-04-05T02:02:00.0000000' AS DateTime2), CAST(N'2024-04-04T01:01:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TicketLine] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketReview] ON 

INSERT [dbo].[TicketReview] ([Id], [TicketId], [TicketReviewNumber], [ReviewedBy], [Comments], [SatisfactoryRate], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (4, 3, N'20240424-000004', 3017, N'hello', 4, 3017, CAST(N'2024-04-29T04:03:44.6610000' AS DateTime2), 3017, CAST(N'2024-04-29T12:03:44.0000000' AS DateTime2))
INSERT [dbo].[TicketReview] ([Id], [TicketId], [TicketReviewNumber], [ReviewedBy], [Comments], [SatisfactoryRate], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (9, 41, N'20240429-000005', 3017, N'ddd', 3, 3017, CAST(N'2024-04-30T14:48:47.7000000' AS DateTime2), 3017, CAST(N'2024-04-30T22:48:47.0000000' AS DateTime2))
INSERT [dbo].[TicketReview] ([Id], [TicketId], [TicketReviewNumber], [ReviewedBy], [Comments], [SatisfactoryRate], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (13, 45, N'20240430-000006', 3017, NULL, 0, 3017, CAST(N'2024-04-30T23:39:10.0000000' AS DateTime2), NULL, CAST(N'2024-04-30T23:39:10.0000000' AS DateTime2))
INSERT [dbo].[TicketReview] ([Id], [TicketId], [TicketReviewNumber], [ReviewedBy], [Comments], [SatisfactoryRate], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (15, 47, N'20240430-000008', 6027, N'dasdasd', 3, 6027, CAST(N'2024-05-09T12:38:20.7560000' AS DateTime2), 6027, CAST(N'2024-05-09T20:38:20.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TicketReview] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (2, N'000002', N'masterAdmin', N'e49edb2706c53653df63a449aaad59234c7a7bad3592f6bce478a23136a5661d', N'Master', N'A', N'Admin', N'Male', CAST(N'2002-01-29' AS Date), N'E Sabellano St. Lopez Compound', N'09497506210', N'../../images/1710507501269.png', 1, 5, 0, 3017, CAST(N'2024-02-25T20:11:03.000' AS DateTime), 2, CAST(N'2024-05-09T20:11:59.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (3017, N'000003', N'Admin1', N'749dc292d00a6ce4d5bb2e7acfc3e18e142bfd6f86c8d5e90d3d1c9667864cff', N'Admin', N'False', N'First', N'Female', CAST(N'2002-01-29' AS Date), N'Y&S Building', N'09123456789', N'../../images/1710501415593.png', 2, 5, 0, 3017, CAST(N'2024-03-14T22:29:51.000' AS DateTime), 2, CAST(N'2024-05-09T21:32:43.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (3020, N'000004', N'Admin', N'17f588345eb02db22ac2bd41d5af6c87d1640d254ffb6a5ec6b6a9f40a9fe077d3701a3bc179dffa460fbf4b31c2ee39', N'Admin', N'Ads', N'Admin', N'Female', CAST(N'2001-08-10' AS Date), N'Y&S Building', N'09123456789', NULL, 2, 7, 0, 3017, CAST(N'2024-03-17T23:28:21.000' AS DateTime), NULL, CAST(N'2024-03-17T23:28:21.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (4027, N'000005', N'UserNi', N'bf8f3eaddf70c2acc3a066dbd70e338eef298533aa452c188ba9b0f59ba87e7d', N'User', N'User', N'User', N'Male', CAST(N'2001-08-10' AS Date), N'qweqw', N'09123456789', NULL, 2, 8, 0, 3017, CAST(N'2024-03-20T21:02:52.000' AS DateTime), NULL, CAST(N'2024-03-23T14:04:25.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (5026, N'000006', N'AdminTest', N'b236beb9ad631ac292b640b788581759c502fd0227b8fa55f3cf16d81155ad59', N'Admin', N'Admin', N'Admin', N'Male', CAST(N'2001-08-10' AS Date), N'Y&S Building', N'09123456789', N'../../images/1711157914552.png', 2, 7, 0, 3017, CAST(N'2024-03-23T09:38:34.000' AS DateTime), NULL, CAST(N'2024-03-23T09:38:34.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (6026, N'000008', N'AdminTesting', N'94eca7966a0bce2b079b9a61cc674be4752becd5158df09bc10f12cc39fb3b2d', N'AdminTesting', N'AdminTesting', N'AdminTesting', N'Male', CAST(N'2000-08-10' AS Date), N'252-building', N'09123456789', NULL, 2, 7, 0, 3017, CAST(N'2024-03-26T16:39:23.000' AS DateTime), NULL, CAST(N'2024-05-03T21:52:07.000' AS DateTime))
INSERT [dbo].[User] ([Id], [Code], [Username], [Password], [Firstname], [Middlename], [Lastname], [Gender], [Birthdate], [Address], [ContactNumber], [Image], [DepartmentId], [RoleId], [isDeactivated], [CreatedBy], [DateCreated], [UpdatedBy], [DateUpdated]) VALUES (6027, N'000009', N'Jaymar123', N'0fa4da7c46e55cf0a34b33aa815982b28040abb17c9a0223c0dcb4e533c6c3c6', N'Jay Mar', N'Padillo', N'Rebanda', N'Male', CAST(N'2001-02-20' AS Date), N'E. Sabellano St. Lopez Compound', N'09497506210', NULL, 2, 8, 0, 3017, CAST(N'2024-05-04T00:46:21.000' AS DateTime), NULL, CAST(N'2024-05-09T21:54:02.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[AccessRight]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_AccessRight] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AccessRight] CHECK CONSTRAINT [FK_CreatedBy_AccessRight]
GO
ALTER TABLE [dbo].[AccessRight]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_AccessRight] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AccessRight] CHECK CONSTRAINT [FK_UpdatedBy_AccessRight]
GO
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_TicketId_Attachment] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_TicketId_Attachment]
GO
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_TicketReviewId_Attachment] FOREIGN KEY([TicketReviewId])
REFERENCES [dbo].[TicketReview] ([Id])
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_TicketReviewId_Attachment]
GO
ALTER TABLE [dbo].[AuditTrail]  WITH CHECK ADD  CONSTRAINT [FK_UserId_AuditTrail] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AuditTrail] CHECK CONSTRAINT [FK_UserId_AuditTrail]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_Client] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_CreatedBy_Client]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_Client] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_UpdatedBy_Client]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_Department] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_CreatedBy_Department]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_Department] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_UpdatedBy_Department]
GO
ALTER TABLE [dbo].[DeviceToken]  WITH CHECK ADD  CONSTRAINT [FK_DeviceToken_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DeviceToken] CHECK CONSTRAINT [FK_DeviceToken_CreatedBy]
GO
ALTER TABLE [dbo].[DeviceToken]  WITH CHECK ADD  CONSTRAINT [FK_DeviceToken_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DeviceToken] CHECK CONSTRAINT [FK_DeviceToken_UpdatedBy]
GO
ALTER TABLE [dbo].[DeviceToken]  WITH CHECK ADD  CONSTRAINT [FK_DeviceToken_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DeviceToken] CHECK CONSTRAINT [FK_DeviceToken_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_UserId_Notification] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_UserId_Notification]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_AccessRight] FOREIGN KEY([AccessRightId])
REFERENCES [dbo].[AccessRight] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_AccessRight]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_CreatedBy]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Role]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_UpdatedBy]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_Product] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_CreatedBy_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_Product] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_UpdatedBy_Product]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_Role] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_CreatedBy_Role]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_Role] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_UpdatedBy_Role]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_AnsweredBy_Ticket] FOREIGN KEY([AnsweredBy])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_AnsweredBy_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_AssignedBy_Ticket] FOREIGN KEY([AssignedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_AssignedBy_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_ClientId_Ticket] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_ClientId_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_Ticket] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_CreatedBy_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_ProductId_Ticket] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_ProductId_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_Ticket] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_UpdatedBy_Ticket]
GO
ALTER TABLE [dbo].[TicketLine]  WITH CHECK ADD  CONSTRAINT [FK_TicketId_TicketLine] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketLine] CHECK CONSTRAINT [FK_TicketId_TicketLine]
GO
ALTER TABLE [dbo].[TicketReview]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy_TicketReview] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketReview] CHECK CONSTRAINT [FK_CreatedBy_TicketReview]
GO
ALTER TABLE [dbo].[TicketReview]  WITH CHECK ADD  CONSTRAINT [FK_ReviewedBy_TicketReview] FOREIGN KEY([ReviewedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketReview] CHECK CONSTRAINT [FK_ReviewedBy_TicketReview]
GO
ALTER TABLE [dbo].[TicketReview]  WITH CHECK ADD  CONSTRAINT [FK_TicketId_TicketReview] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketReview] CHECK CONSTRAINT [FK_TicketId_TicketReview]
GO
ALTER TABLE [dbo].[TicketReview]  WITH CHECK ADD  CONSTRAINT [FK_UpdatedBy_TicketReview] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketReview] CHECK CONSTRAINT [FK_UpdatedBy_TicketReview]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentId_User] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_DepartmentId_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_RoleId_User] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_RoleId_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_CreatedBy]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UpdatedBy]
GO
USE [master]
GO
ALTER DATABASE [Innosoft_TMS] SET  READ_WRITE 
GO
