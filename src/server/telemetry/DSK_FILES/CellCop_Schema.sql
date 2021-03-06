USE [master]
GO
/****** Object:  Database [CellcopMessaging210]    Script Date: 01/14/2016 19:14:38 ******/
CREATE DATABASE [CellcopMessaging210] ON  PRIMARY 
( NAME = N'CellcopMessaging210', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CellcopMessaging210.mdf' , SIZE = 200704KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CellcopMessaging210_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CellcopMessaging210_log.ldf' , SIZE = 1964480KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CellcopMessaging210] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CellcopMessaging210].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CellcopMessaging210] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CellcopMessaging210] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CellcopMessaging210] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CellcopMessaging210] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CellcopMessaging210] SET ARITHABORT OFF
GO
ALTER DATABASE [CellcopMessaging210] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CellcopMessaging210] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CellcopMessaging210] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CellcopMessaging210] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CellcopMessaging210] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CellcopMessaging210] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CellcopMessaging210] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CellcopMessaging210] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CellcopMessaging210] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CellcopMessaging210] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CellcopMessaging210] SET  DISABLE_BROKER
GO
ALTER DATABASE [CellcopMessaging210] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CellcopMessaging210] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CellcopMessaging210] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CellcopMessaging210] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CellcopMessaging210] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CellcopMessaging210] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CellcopMessaging210] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CellcopMessaging210] SET  READ_WRITE
GO
ALTER DATABASE [CellcopMessaging210] SET RECOVERY FULL
GO
ALTER DATABASE [CellcopMessaging210] SET  MULTI_USER
GO
ALTER DATABASE [CellcopMessaging210] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CellcopMessaging210] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CellcopMessaging210', N'ON'
GO
USE [CellcopMessaging210]
GO
/****** Object:  Schema [Security]    Script Date: 01/14/2016 19:14:38 ******/
CREATE SCHEMA [Security] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [NHL]    Script Date: 01/14/2016 19:14:38 ******/
CREATE SCHEMA [NHL] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Lookup]    Script Date: 01/14/2016 19:14:38 ******/
CREATE SCHEMA [Lookup] AUTHORIZATION [dbo]
GO
/****** Object:  Table [Security].[Users]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Security].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Email] [varchar](50) NULL,
	[UnisaAllowed] [bit] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleBCK]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleBCK](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[VehicleLicenceNumber] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Lookup].[Time]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag_Number_Lookup]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_Number_Lookup](
	[Employee Number] [bigint] NULL,
	[Tag Number] [bigint] NULL,
	[Full Tag Number] [nvarchar](255) NULL,
	[Bullet] [int] NULL,
	[EmploymentStatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Rec_ID] [int] NOT NULL,
	[Tag_ID] [nvarchar](50) NULL,
	[EmployeeID] [int] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specimen_Validity_Descriptor]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specimen_Validity_Descriptor](
	[Rec_ID] [int] NOT NULL,
	[Specimen_Validity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_Validity_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specimen_Validity_Descriptor_1] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Specimen_Validity]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Specimen_Validity](
	[Specimen_Validity_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_Validity_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specimen_Validity] PRIMARY KEY CLUSTERED 
(
	[Specimen_Validity_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Specimen_Type]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Specimen_Type](
	[Specimen_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specimen_Type] PRIMARY KEY CLUSTERED 
(
	[Specimen_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specimen_Type]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specimen_Type](
	[Rec_ID] [int] NOT NULL,
	[Specimen_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specimen_Type_1] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Specimen_Test]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NHL].[Specimen_Test](
	[Specimen_Test_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](300) NULL,
 CONSTRAINT [PK_Specimen_Test] PRIMARY KEY CLUSTERED 
(
	[Specimen_Test_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specimen_Test]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Specimen_Test](
	[Specimen_Test_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](300) NULL,
 CONSTRAINT [PK_Specimen_Test] PRIMARY KEY CLUSTERED 
(
	[Specimen_Test_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [NHL].[Specimen_Business_Rule]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Specimen_Business_Rule](
	[Specimen_Business_Rule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NOT NULL,
	[Specimen_Validity_ID] [int] NULL,
 CONSTRAINT [PK_Specimen_Business_Rule] PRIMARY KEY CLUSTERED 
(
	[Specimen_Business_Rule_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specimen_Business_Rule]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specimen_Business_Rule](
	[Rec_ID] [int] NOT NULL,
	[Specimen_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_Validity_ID] [int] NULL,
 CONSTRAINT [PK_Specimen_Business_Rule] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lookup].[Vehicle]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Vehicle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[VehicleLicenceNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lookup].[AccessType]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[AccessType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Laboratory_Scan_IN]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Laboratory_Scan_IN](
	[Laboratory_Scan_IN_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NULL,
	[Laboratory_ID] [int] NULL,
	[Lab_User_ID] [int] NULL,
	[Patient_ID] [int] NULL,
	[Lab_Scan_IN_Time] [datetime] NULL,
 CONSTRAINT [PK_Laboratory_Scan_IN] PRIMARY KEY CLUSTERED 
(
	[Laboratory_Scan_IN_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratory_Scan_IN]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratory_Scan_IN](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NULL,
	[Laboratory_ID] [int] NULL,
	[Lab_User_ID] [int] NULL,
	[Patient_ID] [int] NULL,
	[Lab_Scan_IN_Time] [datetime] NULL,
 CONSTRAINT [PK_Laboratory_Scan_IN] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratory_Description]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratory_Description](
	[Rec_ID] [int] NOT NULL,
	[Laboratory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Laboratory_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Laboratory_Description] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Laboratory]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Laboratory](
	[Laboratory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Laboratory_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[Laboratory_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kiosk_Register_Tag]    Script Date: 01/14/2016 19:14:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kiosk_Register_Tag](
	[Rec_ID] [int] NOT NULL,
	[Kiosk_Schedule_type_ID] [nvarchar](50) NULL,
	[Kiosk_Tag_Number] [nvarchar](50) NULL,
	[Kiosk_Schedule_Command_String] [nvarchar](max) NULL,
	[EmployeeID] [int] NULL,
	[IsActive] [bit] NULL,
	[MsgText] [varchar](max) NULL,
	[AccessTypeID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Journey_Time]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Journey_Time]

AS
BEGIN	
  SET NOCOUNT ON;

  DECLARE 
  @start TIME(0) = '12:00:00 AM', 
  @end   TIME(0) = '11:00:00 PM';

WITH x(n) AS 
(
  SELECT TOP (DATEDIFF(HOUR, @start, @end) + 1) 
  rn = ROW_NUMBER() OVER (ORDER BY [object_id]) 
  FROM sys.all_columns ORDER BY [object_id]
)
SELECT Jtime = DATEADD(HOUR, n-1, @start) FROM x ORDER BY Jtime;
	
END
GO
/****** Object:  Table [dbo].[Shuttle_Type]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shuttle_Type](
	[Rec_ID] [int] NOT NULL,
	[Shuttle_Type] [int] NULL,
	[Shuttle_Description] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule_Table]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Table](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureID] [int] NULL,
	[DestinationID] [int] NULL,
	[DepartureTime] [int] NULL,
	[ArrivalTime] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Scan_OUT]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Scan_OUT](
	[Scan_Out_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NULL,
	[Scan_Out_Time] [datetime] NULL,
	[Laboratory_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Patient_ID] [int] NULL,
 CONSTRAINT [PK_Scan_OUT] PRIMARY KEY CLUSTERED 
(
	[Scan_Out_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scan_OUT]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scan_OUT](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NULL,
	[Scan_Out_Time] [datetime] NULL,
	[Laboratory_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Patient_ID] [int] NULL,
 CONSTRAINT [PK_Scan_OUT] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT](
	[ReceiveID] [numeric](18, 0) NULL,
	[MessageIdentifier] [nvarchar](20) NULL,
	[MessageType] [varchar](20) NULL,
	[TagDate] [varchar](20) NULL,
	[TagTime] [varchar](20) NULL,
	[FullTagNumber] [varchar](20) NULL,
	[ShortTagNumber] [varchar](20) NULL,
	[TagPos] [varchar](20) NULL,
	[AccessGranted] [varchar](20) NULL,
	[ReaderMode] [varchar](20) NULL,
	[AccessType] [varchar](20) NULL,
	[LockStatus] [varchar](20) NULL,
	[Longitude] [varchar](20) NULL,
	[Latitude] [varchar](20) NULL,
	[GPSTime] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiveID] [numeric](18, 0) NULL,
	[MessageIdentifier] [nvarchar](20) NULL,
	[MessageType] [varchar](20) NULL,
	[SMSDate] [varchar](20) NULL,
	[SMSTime] [varchar](20) NULL,
	[TypeOfReply] [varchar](20) NULL,
	[NO] [varchar](20) NULL,
	[AirtimeBalance] [varchar](40) NULL,
	[SMSBalance] [varchar](20) NULL,
	[DataBalance] [varchar](200) NULL,
	[POS] [varchar](20) NULL,
	[CellNo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT](
	[ReceiveID] [numeric](18, 0) NOT NULL,
	[MessageIdentifier] [varchar](50) NULL,
	[MessageType] [varchar](50) NOT NULL,
	[TagDate] [varchar](50) NOT NULL,
	[TagTime] [varchar](50) NOT NULL,
	[GPSStatus] [varchar](50) NOT NULL,
	[Longitude] [varchar](50) NOT NULL,
	[Latitude] [varchar](50) NOT NULL,
	[Altitude] [varchar](50) NOT NULL,
	[Speed] [varchar](50) NOT NULL,
	[Direction] [varchar](50) NOT NULL,
	[NoOfStatelites] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_MESSAGESRECEIVEDUNDELIMITED]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_MESSAGESRECEIVEDUNDELIMITED](
	[ReceiveID] [numeric](18, 0) NOT NULL,
	[TriggeredBy] [nvarchar](20) NOT NULL,
	[Channel] [nvarchar](20) NOT NULL,
	[Value] [nvarchar](20) NOT NULL,
	[Date] [nvarchar](20) NOT NULL,
	[Time] [nvarchar](20) NOT NULL,
	[ChargeVoltage] [nvarchar](20) NOT NULL,
	[BatteryChargeVoltage] [nvarchar](20) NOT NULL,
	[BatteryLoadVoltage] [nvarchar](20) NOT NULL,
	[Monitormode] [nvarchar](20) NOT NULL,
	[Input1] [nvarchar](20) NOT NULL,
	[Input2] [nvarchar](20) NOT NULL,
	[Input3] [nvarchar](20) NOT NULL,
	[Input4] [nvarchar](20) NOT NULL,
	[Input5] [nvarchar](20) NOT NULL,
	[Output1] [nvarchar](20) NOT NULL,
	[Output2] [nvarchar](20) NOT NULL,
	[Analog1] [nvarchar](20) NOT NULL,
	[Analog2] [nvarchar](20) NOT NULL,
	[HourMeter1] [nvarchar](20) NOT NULL,
	[HourMeter2] [nvarchar](20) NOT NULL,
	[HourMeter3] [nvarchar](20) NOT NULL,
	[HourMeter4] [nvarchar](20) NOT NULL,
	[HourMeter5] [nvarchar](20) NOT NULL,
	[Counter1] [nvarchar](20) NOT NULL,
	[Counter2] [nvarchar](20) NOT NULL,
	[Counter3] [nvarchar](20) NOT NULL,
	[Counter4] [nvarchar](20) NOT NULL,
	[Counter5] [nvarchar](20) NOT NULL,
	[LATDeg] [nvarchar](20) NOT NULL,
	[LONDeg] [nvarchar](20) NOT NULL,
	[Altitude] [nvarchar](20) NOT NULL,
	[Speed] [nvarchar](20) NOT NULL,
	[GPSTime] [nvarchar](20) NOT NULL,
	[Direction] [nvarchar](20) NOT NULL,
	[Velocity] [nvarchar](20) NOT NULL,
	[NoOfSat] [nvarchar](20) NOT NULL,
	[END] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_MESSAGESEQUENCE]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESEQUENCE](
	[SequenceMsgID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GateWayID] [numeric](18, 0) NULL,
	[CommType] [char](1) NOT NULL,
	[Handled] [bit] NOT NULL,
	[Msg] [varchar](200) NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_MESSAGESEQUENCE] PRIMARY KEY CLUSTERED 
(
	[SequenceMsgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_GPRSSETTINGS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_GPRSSETTINGS](
	[SettingsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[ConMode] [varchar](5) NOT NULL,
	[ConType] [varchar](5) NOT NULL,
	[IP] [varchar](25) NOT NULL,
	[DNSName] [varchar](64) NOT NULL,
	[DNS1] [varchar](25) NOT NULL,
	[DNS2] [varchar](25) NOT NULL,
	[APN] [varchar](50) NOT NULL,
	[APNLogin] [varchar](50) NOT NULL,
	[APNPWD] [varchar](50) NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_GPRSSETTINGS] PRIMARY KEY CLUSTERED 
(
	[SettingsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_GPRSLOG]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_GPRSLOG](
	[LogID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DateTime] [varchar](50) NOT NULL,
	[PortNumber] [varchar](5) NOT NULL,
	[SiteID] [numeric](18, 0) NOT NULL,
	[SiteName] [varchar](100) NOT NULL,
	[Cellnumber] [varchar](20) NOT NULL,
	[GPRSPWD] [varchar](10) NOT NULL,
	[SIMIMI] [varchar](50) NOT NULL,
	[PoleID] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[LoginCode] [varchar](2) NOT NULL,
	[LoginStatus] [varchar](50) NOT NULL,
	[CellCopSerialNo] [varchar](50) NOT NULL,
	[RealTimeClock] [varchar](20) NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_GPRSLOG] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_GATEWAYS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_GATEWAYS](
	[GatewayID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[SerialNo] [varchar](50) NOT NULL,
	[Settings] [varchar](20) NOT NULL,
	[PIN] [varchar](10) NOT NULL,
	[CommPort] [varchar](20) NOT NULL,
	[Interval] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[CellNumber] [varchar](20) NOT NULL,
	[MsgMissedCounter] [numeric](18, 0) NOT NULL,
	[MsgSendCounter] [numeric](18, 0) NOT NULL,
	[MsgReportCounter] [numeric](18, 0) NOT NULL,
	[MsgInternalCounter] [numeric](18, 0) NOT NULL,
	[CounterDTStamp] [datetime] NOT NULL,
	[VersionNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](20) NOT NULL,
	[CompileDate] [varchar](20) NOT NULL,
	[StatusDTStamp] [datetime] NOT NULL,
	[SwitchPhoneOffOnTamper] [bit] NOT NULL,
	[Cell1] [varchar](20) NOT NULL,
	[Cell2] [varchar](20) NOT NULL,
	[Cell3] [varchar](20) NOT NULL,
	[AlarmTimePCDisconnected] [int] NOT NULL,
	[AlarmTimePCConnected] [int] NOT NULL,
	[AlarmTimePowerOff] [int] NOT NULL,
	[AlarmTimePowerOn] [int] NOT NULL,
	[AlarmMsgTamper] [varchar](30) NOT NULL,
	[AlarmMsgPCDisconnected] [varchar](30) NOT NULL,
	[AlarmMsgPCConnected] [varchar](30) NOT NULL,
	[AlarmMsgPowerOff] [varchar](30) NOT NULL,
	[AlarmMsgPowerOn] [varchar](30) NOT NULL,
	[Alarm2Tamper] [char](3) NOT NULL,
	[Alarm2PCDisconnected] [char](3) NOT NULL,
	[Alarm2PCConnected] [char](3) NOT NULL,
	[Alarm2PowerOff] [char](3) NOT NULL,
	[Alarm2PowerOn] [char](3) NOT NULL,
	[RFStrengh] [int] NOT NULL,
	[PhonePower] [char](1) NOT NULL,
	[Battery] [bit] NOT NULL,
	[BatteryVal] [float] NOT NULL,
	[Charger] [bit] NOT NULL,
	[ChargerVal] [float] NOT NULL,
	[TamperLight] [bit] NOT NULL,
	[TamperLightVal] [float] NOT NULL,
	[PCSMSConnected] [bit] NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_GATEWAYS] PRIMARY KEY CLUSTERED 
(
	[GatewayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_CONTACTS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_CONTACTS](
	[ContactID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FirstName] [char](100) NULL,
	[LastName] [char](100) NULL,
	[CellphoneNumber] [varchar](50) NOT NULL,
	[Email] [char](100) NULL,
	[Company] [char](100) NULL,
	[Address] [char](100) NULL,
	[City] [char](100) NULL,
	[State] [char](100) NULL,
	[PostalCode] [char](10) NULL,
	[Country] [char](100) NULL,
	[Photo] [image] NULL,
	[BirthDate] [datetime] NULL,
 CONSTRAINT [PK__Contacts__54CB950F] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_CONNECTIONTYPE]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_CONNECTIONTYPE](
	[ConnTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CM_CONNECTIONTYPE] PRIMARY KEY CLUSTERED 
(
	[ConnTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_COMMUNICATORTYPE]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_COMMUNICATORTYPE](
	[CommunicatorTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Version] [varchar](250) NOT NULL,
 CONSTRAINT [PK_COMMUNICATORTYPE] PRIMARY KEY CLUSTERED 
(
	[CommunicatorTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [NHL].[Clinic]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Clinic](
	[Clinic_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clinic_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[Clinic_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_USERS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_USERS](
	[UserID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[LastAccess] [datetime] NULL,
	[Enabled] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastAccTime] [datetime] NULL,
	[CreatedTime] [datetime] NULL,
	[AccessCount] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_CA_USERS] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_USER_GROUPS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_USER_GROUPS](
	[GroupID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_CA_USER_GROUPS] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_USER_GROUP_MEMBERS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_USER_GROUP_MEMBERS](
	[ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CA_GROUP_MEMBERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_USER_GROUP_ACCESS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_USER_GROUP_ACCESS](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[Permission] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CA_USER_GROUP_ACCESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_USER_ACCESS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_USER_ACCESS](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Permission] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CA_USER_ACCESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_PERMISSIONS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_PERMISSIONS](
	[Permission] [varchar](50) NOT NULL,
	[Items] [text] NOT NULL,
	[Action] [int] NOT NULL,
	[FormName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CA_PERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[Permission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_CONTACT_GROUPS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CA_CONTACT_GROUPS](
	[ContactGroupID] [numeric](10, 0) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_CM_Contact_Groups] PRIMARY KEY CLUSTERED 
(
	[ContactGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CA_CONTACT_GROUP_MEMBERS]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_CONTACT_GROUP_MEMBERS](
	[ContactGroupId] [numeric](10, 0) NOT NULL,
	[ContactId] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_CA_CONTACTGROUP_MEMBERS] PRIMARY KEY CLUSTERED 
(
	[ContactGroupId] ASC,
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BulletScheduleArchive]    Script Date: 01/14/2016 19:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BulletScheduleArchive](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[VehicleID] [int] NULL,
	[TimeID] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_BulletScheduleArchive] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BulletRequest]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BulletRequest](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DateForBullet] [datetime] NOT NULL,
	[Time] [int] NOT NULL,
	[Requester] [varchar](25) NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Notes] [varchar](max) NULL,
	[RC_Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_BulletRequest] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[BulletLocation]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[BulletLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_REFRESH]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_REFRESH](
	[FunctionType] [varchar](50) NOT NULL,
	[DoAction] [bit] NOT NULL,
	[Specific] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_CM_REFRESH] PRIMARY KEY CLUSTERED 
(
	[FunctionType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[Bullet]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Bullet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employment_Status]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employment_Status](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Status_ID] [int] NULL,
	[Emp_Status_Description] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[EmployeeStatus]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[EmployeeStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Tag_Number]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Tag_Number](
	[Employee Number] [float] NULL,
	[Tag Number] [bigint] NULL,
	[Full Tag Number] [nvarchar](255) NULL,
	[Bullet] [int] NULL,
	[EmploymentStatus] [int] NULL,
	[Employee_Name] [nvarchar](255) NULL,
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Employee_Tag_Number] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Table]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Table](
	[Rec_ID] [int] NOT NULL,
	[Employee_number] [nchar](10) NULL,
	[Employee_name] [nvarchar](50) NULL,
	[Employee_surname] [nvarchar](50) NULL,
	[Employee_Card_Number] [int] NULL,
	[IsActive] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedUserID] [int] NULL,
	[Cellphone] [nchar](15) NULL,
	[Work_Address] [varchar](100) NULL,
	[Home_Address] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[Driver]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Driver](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Doctor]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [NHL].[Doctor](
	[Doctor_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[ContactNumber] [varchar](20) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[Destination]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Destination](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Lookup].[Departure]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lookup].[Departure](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departure]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departure](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_SITE]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_SITE](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[HardwareTypeID] [int] NOT NULL,
	[SiteNumber] [nvarchar](250) NOT NULL,
	[CellNo] [varchar](20) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[GPRSEnabled] [bit] NOT NULL,
	[GPRSServerSettings] [int] NOT NULL,
	[GPRSPort] [varchar](50) NOT NULL,
	[GPRSPWD] [varchar](20) NOT NULL,
	[GPRSOnLoginCheck] [int] NOT NULL,
	[GPRSConnType] [int] NOT NULL,
	[GPRSAckRequired] [bit] NOT NULL,
	[GPRSSuccClearSMS] [bit] NOT NULL,
	[PRGPWD] [varchar](50) NOT NULL,
	[CMDPWD] [varchar](50) NOT NULL,
	[SIMIMI] [varchar](50) NOT NULL,
	[GPRSPOLEID] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[CommSerialNo] [varchar](50) NOT NULL,
	[GPRSConnected] [bit] NOT NULL,
	[LastRXTimestamp] [varchar](20) NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_COMMUNICATORS] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AllocationArchive]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocationArchive](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NULL,
	[VehicleDescriptionNrID] [int] NULL,
	[VehicleRegistrationNr] [nvarchar](20) NULL,
	[DriverID] [int] NULL,
	[AllocationDate] [datetime] NULL,
 CONSTRAINT [PK_AllocationArchive] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allocation]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allocation](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NULL,
	[VehicleDescriptionNrID] [int] NULL,
	[VehicleRegistrationNr] [nvarchar](20) NULL,
	[DriverID] [int] NULL,
	[AllocationDate] [datetime] NULL,
 CONSTRAINT [PK_Allocation] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_MISSEDCALLSRECEIVED]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MISSEDCALLSRECEIVED](
	[MissedCallID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GatewayID] [numeric](18, 0) NOT NULL,
	[CellPhone] [varchar](50) NOT NULL,
	[SiteID] [int] NOT NULL,
	[SiteName] [varchar](250) NOT NULL,
	[Calltype] [varchar](50) NOT NULL,
	[ReceiveDateTime] [varchar](20) NOT NULL,
	[SeqRef] [char](3) NOT NULL,
	[Dropped] [bit] NOT NULL,
	[Processed] [bit] NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_MISSEDCALLSRECEIVED] PRIMARY KEY CLUSTERED 
(
	[MissedCallID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BulletScheduleAfternoon]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BulletScheduleAfternoon](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[VehicleID] [int] NULL,
	[TimeID] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_BulletScheduleAfternoon] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BulletSchedule]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BulletSchedule](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[VehicleID] [int] NULL,
	[TimeID] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_BulletSchedule] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NHL].[Scan_IN]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NHL].[Scan_IN](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[Specimen_ID] [int] NULL,
	[Clinic_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Car_ID] [int] NULL,
	[Patient_ID] [int] NULL,
	[Scan_IN_Time] [datetime] NULL,
	[Doctor_ID] [int] NULL,
	[Specimen_Test_ID] [int] NULL,
 CONSTRAINT [PK_Scan_IN] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PretoriaFloridaScheduleBackup]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PretoriaFloridaScheduleBackup](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[VudecDepart] [nvarchar](10) NULL,
	[SunnysideDepart] [nvarchar](10) NULL,
	[MuckleneukDepart] [nvarchar](10) NULL,
	[FloridaArrival] [nvarchar](10) NULL,
	[VehicleID] [int] NULL,
	[HazelwoodDepart] [nvarchar](10) NULL,
	[BrooklynDepart] [nvarchar](10) NULL,
 CONSTRAINT [PK_PretoriaFloridaScheduleBackup] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PretoriaFloridaSchedule]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PretoriaFloridaSchedule](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[VudecDepart] [nvarchar](10) NULL,
	[SunnysideDepart] [nvarchar](10) NULL,
	[MuckleneukDepart] [nvarchar](10) NULL,
	[FloridaArrival] [nvarchar](10) NULL,
	[VehicleID] [int] NULL,
	[HazelwoodDepart] [nvarchar](10) NULL,
	[BrooklynDepart] [nvarchar](10) NULL,
	[Start_Time] [nchar](10) NULL,
	[End_Time] [nchar](10) NULL,
 CONSTRAINT [PK_PretoriaFloridaSchedule] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FloridaPretoriaScheduleBackup]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FloridaPretoriaScheduleBackup](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartFlorida] [nvarchar](10) NULL,
	[MuckleneukArrival] [nvarchar](10) NULL,
	[SunnysideArrival] [nvarchar](10) NULL,
	[VudecArrival] [nvarchar](10) NULL,
	[HazelwoodArrival] [nvarchar](10) NULL,
	[VehicleID] [int] NULL,
 CONSTRAINT [PK_FloridaPretoriaScheduleBackup] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FloridaPretoriaSchedule]    Script Date: 01/14/2016 19:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FloridaPretoriaSchedule](
	[Rec_ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartFlorida] [nvarchar](10) NULL,
	[MuckleneukArrival] [nvarchar](10) NULL,
	[SunnysideArrival] [nvarchar](10) NULL,
	[VudecArrival] [nvarchar](10) NULL,
	[HazelwoodArrival] [nvarchar](10) NULL,
	[VehicleID] [int] NULL,
	[Start_Time] [nchar](10) NULL,
	[End_Time] [nchar](10) NULL,
 CONSTRAINT [PK_FloridaPretoriaSchedule] PRIMARY KEY CLUSTERED 
(
	[Rec_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FloridaToPretoria_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FloridaToPretoria_View]
AS
SELECT     TOP (100) PERCENT dbo.CM_SITE.SiteID, dbo.CM_SITE.SiteNumber, dbo.CM_SITE.Name, dbo.FloridaPretoriaSchedule.DepartFlorida, 
                      dbo.FloridaPretoriaSchedule.MuckleneukArrival, dbo.FloridaPretoriaSchedule.SunnysideArrival, dbo.FloridaPretoriaSchedule.VudecArrival, 
                      dbo.FloridaPretoriaSchedule.HazelwoodArrival, Lookup.Vehicle.Name AS Vehicle_Name, case when  dbo.FloridaPretoriaSchedule.DepartFlorida  <> '--'
		 then  dbo.FloridaPretoriaSchedule.DepartFlorida
		 else  
         case when  dbo.FloridaPretoriaSchedule.MuckleneukArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.MuckleneukArrival 
		 else 		 
		 case when  dbo.FloridaPretoriaSchedule.SunnysideArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.SunnysideArrival 
		 else 
		 case when  dbo.FloridaPretoriaSchedule.VudecArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.VudecArrival 
		 else case when  dbo.FloridaPretoriaSchedule.HazelwoodArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.HazelwoodArrival 
		 end 
		 end
		 end
		 end
		 end 'StartTime',
		 case when  dbo.FloridaPretoriaSchedule.HazelwoodArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.HazelwoodArrival
		 else 		 
		 case when  dbo.FloridaPretoriaSchedule.VudecArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.VudecArrival 
		 else 
		 case when  dbo.FloridaPretoriaSchedule.SunnysideArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.SunnysideArrival 
		 else case when  dbo.FloridaPretoriaSchedule.MuckleneukArrival <> '--'
		 then  dbo.FloridaPretoriaSchedule.MuckleneukArrival 
		 else case when  dbo.FloridaPretoriaSchedule.DepartFlorida <> '--'
		 then  dbo.FloridaPretoriaSchedule.DepartFlorida 
		 end 
		 end
		 end
		 end
		 end 'EndTime'
FROM         Lookup.Vehicle INNER JOIN
                      dbo.Allocation INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.FloridaPretoriaSchedule ON dbo.Allocation.VehicleDescriptionNrID = dbo.FloridaPretoriaSchedule.VehicleID
ORDER BY dbo.FloridaPretoriaSchedule.Start_Time
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[19] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 7
               Left = 1057
               Bottom = 240
               Right = 1280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 27
               Left = 414
               Bottom = 249
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 9
               Left = 43
               Bottom = 304
               Right = 332
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FloridaPretoriaSchedule"
            Begin Extent = 
               Top = 173
               Left = 726
               Bottom = 419
               Right = 1008
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FloridaToPretoria_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FloridaToPretoria_View'
GO
/****** Object:  View [dbo].[PretoriaFlorida_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PretoriaFlorida_View]
AS

 SELECT     dbo.CM_SITE.Name, dbo.PretoriaFloridaSchedule.VudecDepart, dbo.PretoriaFloridaSchedule.SunnysideDepart, dbo.PretoriaFloridaSchedule.MuckleneukDepart, 
                      dbo.PretoriaFloridaSchedule.FloridaArrival, dbo.CM_SITE.SiteNumber, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, 
                      dbo.PretoriaFloridaSchedule.HazelwoodDepart, dbo.PretoriaFloridaSchedule.BrooklynDepart,
                      case when  dbo.PretoriaFloridaSchedule.HazelwoodDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.HazelwoodDepart
		 else  
  case when  dbo.PretoriaFloridaSchedule.BrooklynDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.BrooklynDepart 
		 else 		 
		 case when  dbo.PretoriaFloridaSchedule.VudecDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.VudecDepart 
		 else 
		 case when  dbo.PretoriaFloridaSchedule.SunnysideDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.SunnysideDepart 
		 else case when  dbo.PretoriaFloridaSchedule.MuckleneukDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.MuckleneukDepart 
		 else case when  dbo.PretoriaFloridaSchedule.FloridaArrival <> '--'
		 then  dbo.PretoriaFloridaSchedule.FloridaArrival 
		 end 
		 end
		 end
		 end
		 end
		 end 'StartTime',case when  dbo.PretoriaFloridaSchedule.FloridaArrival  <> '--'
		 then  dbo.PretoriaFloridaSchedule.FloridaArrival 
		 else  
         case when  dbo.PretoriaFloridaSchedule.MuckleneukDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.MuckleneukDepart 
		 else 		 
		 case when  dbo.PretoriaFloridaSchedule.SunnysideDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.SunnysideDepart 
		 else 
		 case when  dbo.PretoriaFloridaSchedule.VudecDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.VudecDepart 
		 else case when  dbo.PretoriaFloridaSchedule.BrooklynDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.BrooklynDepart 
		 else case when  dbo.PretoriaFloridaSchedule.HazelwoodDepart <> '--'
		 then  dbo.PretoriaFloridaSchedule.HazelwoodDepart 
		 end 
		 end
		 end
		 end
		 end
		 end 'EndTime', dbo.PretoriaFloridaSchedule.Rec_ID
FROM         Lookup.Vehicle INNER JOIN
                      dbo.Allocation INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.PretoriaFloridaSchedule ON dbo.Allocation.VehicleDescriptionNrID = dbo.PretoriaFloridaSchedule.VehicleID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 4
               Left = 1092
               Bottom = 129
               Right = 1315
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 10
               Left = 413
               Bottom = 227
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 252
               Right = 344
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PretoriaFloridaSchedule"
            Begin Extent = 
               Top = 153
               Left = 676
               Bottom = 384
               Right = 1024
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PretoriaFlorida_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PretoriaFlorida_View'
GO
/****** Object:  View [dbo].[Vehicle_Allocation_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vehicle_Allocation_View]
AS
SELECT     TOP (100) PERCENT Lookup.Driver.ID, Lookup.Vehicle.Name AS [Vehicle Name], Lookup.Driver.Name AS [Driver Name], dbo.CM_SITE.SiteNumber, 
                      dbo.CM_SITE.SiteID, dbo.CM_SITE.Name AS SiteName, dbo.Allocation.AllocationDate
FROM         dbo.Allocation INNER JOIN
                      Lookup.Vehicle ON dbo.Allocation.VehicleDescriptionNrID = Lookup.Vehicle.ID INNER JOIN
                      Lookup.Driver ON dbo.Allocation.DriverID = Lookup.Driver.ID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID
ORDER BY [Vehicle Name]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 301
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 72
               Left = 401
               Bottom = 180
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 0
               Left = 592
               Bottom = 93
               Right = 777
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Driver (Lookup)"
            Begin Extent = 
               Top = 211
               Left = 505
               Bottom = 289
               Right = 656
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vehicle_Allocation_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vehicle_Allocation_View'
GO
/****** Object:  Table [dbo].[CM_MESSAGESRECEIVED]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESRECEIVED](
	[ReceiveID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FromSiteID] [int] NOT NULL,
	[FromContactID] [numeric](18, 0) NOT NULL,
	[MsgType] [varchar](50) NOT NULL,
	[MsgProvider] [varchar](50) NOT NULL,
	[GatewayID] [numeric](18, 0) NOT NULL,
	[CellPhone] [varchar](50) NOT NULL,
	[msgText] [varchar](480) NOT NULL,
	[EventDateTime] [datetime] NULL,
	[SendDateTime] [varchar](20) NOT NULL,
	[ReceiveDateTime] [varchar](20) NOT NULL,
	[Processed] [bit] NOT NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_CM_MESSAGESRECEIVED] PRIMARY KEY CLUSTERED 
(
	[ReceiveID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CM_MESSAGESSEND]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CM_MESSAGESSEND](
	[SendID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GatewayID] [numeric](18, 0) NOT NULL,
	[ToSiteID] [int] NOT NULL,
	[CellPhone] [varchar](20) NOT NULL,
	[MsgText] [varchar](160) NOT NULL,
	[RepRequired] [bit] NOT NULL,
	[Flash] [bit] NOT NULL,
	[VP] [char](2) NOT NULL,
	[Priority] [int] NOT NULL,
	[SendStatus] [char](2) NOT NULL,
	[MsgRef] [varchar](3) NOT NULL,
	[SendDateTime] [varchar](20) NOT NULL,
	[ReceiveDateTime] [varchar](20) NOT NULL,
	[UseMsgProvider] [varchar](50) NOT NULL,
	[SendMsgProvider] [varchar](50) NOT NULL,
	[ExpireFlag] [bit] NOT NULL,
	[ExpireTime] [int] NOT NULL,
	[ByUserID] [numeric](18, 0) NULL,
	[TheDateTimeStamp] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[ExpireDT] [datetime] NULL,
 CONSTRAINT [PK_CM_MESSAGESSEND] PRIMARY KEY CLUSTERED 
(
	[SendID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Bullet_Schedule_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bullet_Schedule_View]
AS
SELECT     Lookup.Time.Name AS Time, Lookup.BulletLocation.Name AS Location, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, 
                      dbo.Allocation.VehicleRegistrationNr, dbo.BulletSchedule.Date, Lookup.Driver.Name AS Driver_Name
FROM         Lookup.Vehicle INNER JOIN
                      dbo.BulletSchedule ON Lookup.Vehicle.ID = dbo.BulletSchedule.VehicleID AND Lookup.Vehicle.ID = dbo.BulletSchedule.VehicleID INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID INNER JOIN
                      Lookup.Time ON dbo.BulletSchedule.TimeID = Lookup.Time.ID INNER JOIN
                      Lookup.BulletLocation ON dbo.BulletSchedule.LocationID = Lookup.BulletLocation.ID INNER JOIN
                      Lookup.Driver ON dbo.Allocation.DriverID = Lookup.Driver.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[13] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 302
               Left = 262
               Bottom = 421
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletSchedule"
            Begin Extent = 
               Top = 6
               Left = 12
               Bottom = 248
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 271
               Left = 762
               Bottom = 428
               Right = 978
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 30
               Left = 1069
               Bottom = 262
               Right = 1366
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Time (Lookup)"
            Begin Extent = 
               Top = 168
               Left = 300
               Bottom = 273
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletLocation (Lookup)"
            Begin Extent = 
               Top = 20
               Left = 500
               Bottom = 165
               Right = 760
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Driver (Lookup)"
            Begin Extent = 
               Top = 281
               Left = 1057
               Bottom = 381
               Right =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1282
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_View'
GO
/****** Object:  View [dbo].[Bullet_Schedule_Historical]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bullet_Schedule_Historical]
AS
SELECT     Lookup.Time.Name AS Time, Lookup.BulletLocation.Name AS Location, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, 
                      dbo.Allocation.VehicleRegistrationNr, Lookup.Driver.Name AS Driver_Name, dbo.BulletScheduleArchive.Date
FROM         Lookup.Vehicle INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID INNER JOIN
                      Lookup.Driver ON dbo.Allocation.DriverID = Lookup.Driver.ID INNER JOIN
                      dbo.BulletScheduleArchive INNER JOIN
                      Lookup.Time ON dbo.BulletScheduleArchive.TimeID = Lookup.Time.ID INNER JOIN
                      Lookup.BulletLocation ON dbo.BulletScheduleArchive.LocationID = Lookup.BulletLocation.ID ON Lookup.Vehicle.ID = dbo.BulletScheduleArchive.VehicleID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 6
               Left = 450
               Bottom = 114
               Right = 638
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 114
               Right = 853
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Time (Lookup)"
            Begin Extent = 
               Top = 241
               Left = 821
               Bottom = 334
               Right = 972
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletLocation (Lookup)"
            Begin Extent = 
               Top = 154
               Left = 547
               Bottom = 232
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Driver (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 1269
               Bottom = 84
               Right = 1420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletScheduleArchive"
            Begin Extent = 
               Top = 152
               Left = 104
               Bottom = 338
               Right =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Historical'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Historical'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Historical'
GO
/****** Object:  View [dbo].[Bullet_Schedule_Afternoon_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bullet_Schedule_Afternoon_View]
AS
SELECT     Lookup.Time.Name AS Time, Lookup.BulletLocation.Name AS Location, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, 
                      dbo.Allocation.VehicleRegistrationNr, Lookup.Driver.Name AS Driver_Name, dbo.BulletScheduleAfternoon.Date
FROM         Lookup.Time INNER JOIN
                      Lookup.Driver INNER JOIN
                      Lookup.Vehicle INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID ON Lookup.Driver.ID = dbo.Allocation.DriverID INNER JOIN
                      dbo.BulletScheduleAfternoon ON Lookup.Vehicle.ID = dbo.BulletScheduleAfternoon.VehicleID INNER JOIN
                      Lookup.BulletLocation ON dbo.BulletScheduleAfternoon.LocationID = Lookup.BulletLocation.ID ON Lookup.Time.ID = dbo.BulletScheduleAfternoon.TimeID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Time (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 891
               Bottom = 99
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Driver (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 1269
               Bottom = 84
               Right = 1420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 122
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 6
               Left = 450
               Bottom = 114
               Right = 638
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 114
               Right = 853
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletScheduleAfternoon"
            Begin Extent = 
               Top = 158
               Left = 479
               Bottom = 309
               Right = 664
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletLocation (Lookup)"
            Begin Extent = 
               Top = 6
               Left = 1080
               Bottom = 84
               Right = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Afternoon_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Afternoon_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Schedule_Afternoon_View'
GO
/****** Object:  View [dbo].[Bullet_Users_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bullet_Users_View]
AS
SELECT     Lookup.Time.Name AS Time, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, dbo.Allocation.VehicleRegistrationNr, dbo.BulletSchedule.Date, 
                      dbo.Employee_Tag_Number.[Tag Number], dbo.Employee_Tag_Number.[Employee Number], dbo.Employee_Tag_Number.Employee_Name, 
                      dbo.Employee_Tag_Number.EmploymentStatus, dbo.Employee_Tag_Number.Bullet, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagDate, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagTime, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode, dbo.CM_MESSAGESRECEIVED.ReceiveDateTime, 
                      dbo.CM_MESSAGESRECEIVED.SendDateTime, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessType, dbo.CM_SITE.TheDateTimeStamp, 
                      dbo.Employment_Status.Emp_Status_Description, dbo.CM_MESSAGESRECEIVED.FromSiteID, Lookup.BulletLocation.Name AS Location, 
                      dbo.CM_MESSAGESRECEIVED.TheDateTimeStamp AS Date_Stamp, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude AS Longitude, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime AS Latitude, dbo.CM_MESSAGESRECEIVED.EventDateTime
FROM         dbo.Employment_Status INNER JOIN
                      dbo.Employee_Tag_Number ON dbo.Employment_Status.Emp_Status_ID = dbo.Employee_Tag_Number.EmploymentStatus INNER JOIN
                      Lookup.Vehicle INNER JOIN
                      dbo.BulletSchedule ON Lookup.Vehicle.ID = dbo.BulletSchedule.VehicleID AND Lookup.Vehicle.ID = dbo.BulletSchedule.VehicleID INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID INNER JOIN
                      Lookup.Time ON dbo.BulletSchedule.TimeID = Lookup.Time.ID INNER JOIN
                      Lookup.BulletLocation ON dbo.BulletSchedule.LocationID = Lookup.BulletLocation.ID INNER JOIN
                      dbo.CM_MESSAGESRECEIVED ON dbo.CM_SITE.SiteID = dbo.CM_MESSAGESRECEIVED.FromSiteID INNER JOIN
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT ON 
                      dbo.CM_MESSAGESRECEIVED.ReceiveID = dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID ON 
                      dbo.Employee_Tag_Number.[Tag Number] = dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber
WHERE     (dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[18] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employment_Status"
            Begin Extent = 
               Top = 247
               Left = 706
               Bottom = 359
               Right = 902
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee_Tag_Number"
            Begin Extent = 
               Top = 235
               Left = 975
               Bottom = 396
               Right = 1144
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 16
               Left = 20
               Bottom = 169
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletSchedule"
            Begin Extent = 
               Top = 168
               Left = 252
               Bottom = 276
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 3
               Left = 475
               Bottom = 111
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 0
               Left = 735
               Bottom = 209
               Right = 935
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Time (Lookup)"
            Begin Extent = 
               Top = 241
               Left = 503
               Bottom = 334
               Right = 654' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletLocation (Lookup)"
            Begin Extent = 
               Top = 124
               Left = 499
               Bottom = 202
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 3
               Left = 982
               Bottom = 206
               Right = 1207
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT"
            Begin Extent = 
               Top = 53
               Left = 1256
               Bottom = 302
               Right = 1546
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_View'
GO
/****** Object:  View [dbo].[Bullet_Users_Historical_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bullet_Users_Historical_View]
AS
SELECT     Lookup.Time.Name AS Time, dbo.CM_SITE.SiteID, Lookup.Vehicle.Name AS Vehicle_Name, dbo.Allocation.VehicleRegistrationNr, 
                      dbo.Employee_Tag_Number.[Tag Number], dbo.Employee_Tag_Number.[Employee Number], dbo.Employee_Tag_Number.Employee_Name, 
                      dbo.Employee_Tag_Number.EmploymentStatus, dbo.Employee_Tag_Number.Bullet, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagDate, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagTime, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode, dbo.CM_MESSAGESRECEIVED.ReceiveDateTime, 
                      dbo.CM_MESSAGESRECEIVED.SendDateTime, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessType, dbo.CM_SITE.TheDateTimeStamp, 
                      dbo.Employment_Status.Emp_Status_Description, dbo.CM_MESSAGESRECEIVED.FromSiteID, Lookup.BulletLocation.Name AS Location, 
                      dbo.CM_MESSAGESRECEIVED.TheDateTimeStamp AS Date_Stamp, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude AS Longitude, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime AS Latitude, dbo.BulletScheduleArchive.Date, dbo.CM_MESSAGESRECEIVED.EventDateTime
FROM         Lookup.Time INNER JOIN
                      dbo.BulletScheduleArchive INNER JOIN
                      dbo.CM_MESSAGESRECEIVED INNER JOIN
                      Lookup.Vehicle INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_SITE ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID ON dbo.CM_MESSAGESRECEIVED.FromSiteID = dbo.CM_SITE.SiteID INNER JOIN
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT ON 
                      dbo.CM_MESSAGESRECEIVED.ReceiveID = dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID INNER JOIN
                      dbo.Employment_Status INNER JOIN
                      dbo.Employee_Tag_Number ON dbo.Employment_Status.Emp_Status_ID = dbo.Employee_Tag_Number.EmploymentStatus ON 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = dbo.Employee_Tag_Number.[Tag Number] ON 
                      dbo.BulletScheduleArchive.VehicleID = Lookup.Vehicle.ID INNER JOIN
                      Lookup.BulletLocation ON dbo.BulletScheduleArchive.LocationID = Lookup.BulletLocation.ID ON Lookup.Time.ID = dbo.BulletScheduleArchive.TimeID
WHERE     (dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Time (Lookup)"
            Begin Extent = 
               Top = 269
               Left = 1092
               Bottom = 362
               Right = 1243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletScheduleArchive"
            Begin Extent = 
               Top = 345
               Left = 440
               Bottom = 453
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 102
               Left = 479
               Bottom = 262
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 215
               Left = 147
               Bottom = 308
               Right = 332
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 150
               Left = 904
               Bottom = 258
               Right = 1092
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 6
               Left = 1117
               Bottom = 154
               Right = 1294
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT"
            Begin Extent = 
               Top = 102
               Left = 1332
               Bot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_Historical_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'tom = 292
               Right = 1498
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Employment_Status"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee_Tag_Number"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 114
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BulletLocation (Lookup)"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 180
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_Historical_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Bullet_Users_Historical_View'
GO
/****** Object:  View [dbo].[Tracker_View]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tracker_View]
AS
SELECT     dbo.CM_MESSAGESRECEIVED.ReceiveID, dbo.CM_MESSAGESRECEIVED.FromSiteID, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.ReceiveID AS Expr1, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.TagDate, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.TagTime, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.Longitude, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.Latitude, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.Speed, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.Direction, dbo.CM_SITE.SiteID, 
                      dbo.CM_SITE.Name, dbo.CM_SITE.SiteNumber, dbo.CM_MESSAGESRECEIVED.SendDateTime, dbo.CM_MESSAGESRECEIVED.TheDateTimeStamp
FROM         Lookup.Vehicle INNER JOIN
                      dbo.Allocation ON Lookup.Vehicle.ID = dbo.Allocation.VehicleDescriptionNrID INNER JOIN
                      dbo.CM_MESSAGESRECEIVED INNER JOIN
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT ON 
                      dbo.CM_MESSAGESRECEIVED.ReceiveID = dbo.CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.ReceiveID INNER JOIN
                      dbo.CM_SITE ON dbo.CM_MESSAGESRECEIVED.FromSiteID = dbo.CM_SITE.SiteID ON dbo.Allocation.DeviceID = dbo.CM_SITE.SiteID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 323
               Right = 327
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT"
            Begin Extent = 
               Top = 145
               Left = 373
               Bottom = 464
               Right = 754
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 14
               Left = 848
               Bottom = 368
               Right = 1083
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Allocation"
            Begin Extent = 
               Top = 235
               Left = 1264
               Bottom = 343
               Right = 1452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vehicle (Lookup)"
            Begin Extent = 
               Top = 48
               Left = 1166
               Bottom = 141
               Right = 1351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Tracker_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Tracker_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Tracker_View'
GO
/****** Object:  View [dbo].[vPassengerPtaToFlorida]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vPassengerPtaToFlorida]
As 

SELECT  distinct (Employee.Employee_Name) As Employee_Name
       ,Employee.[Employee Number] as EmployeeNumber
       ,Empstatus.Emp_Status_Description as EmploymentStatus
       ,Convert(date, MESSAGESRECEIVED.EventDateTime) As TagEventDate
       ,Convert(time, MESSAGESRECEIVED.EventDateTime) As TagEventTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagDate]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagTime]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[FullTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ShortTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ReaderMode]
      ,vehicle.Name as SiteNumber    
      
  FROM [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT] MESSAGESRECEIVEDUNDELIMITEDTAGEVENT
  Join [dbo].[CM_MESSAGESRECEIVED] MESSAGESRECEIVED
    on  MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID = MESSAGESRECEIVED.ReceiveID
  join dbo.Allocation allocation
    on MESSAGESRECEIVED.FromSiteID =  allocation.DeviceID 
  join [Lookup].Vehicle vehicle
     on  allocation.VehicleDescriptionNrID  = vehicle.ID
  join [dbo].Employee_Tag_Number Employee
     on   MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = Employee.[Tag Number]
  join dbo.Employment_Status Empstatus
    on Employee.EmploymentStatus = Empstatus.Emp_Status_ID
  join dbo.PretoriaFloridaSchedule PtaFloridaSchedule
    on   vehicle.ID = PtaFloridaSchedule.VehicleID
    
where allocation.VehicleDescriptionNrID = vehicle.ID
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode = 1
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1
GO
/****** Object:  View [dbo].[vPassengerFloridaToPTA]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vPassengerFloridaToPTA]
As 

SELECT  distinct (Employee.Employee_Name) As Employee_Name
       ,Employee.[Employee Number] as EmployeeNumber
       ,Empstatus.Emp_Status_Description as EmploymentStatus
       ,Convert(date, MESSAGESRECEIVED.TheDateTimeStamp) As TagEventDate
       ,Convert(time, MESSAGESRECEIVED.TheDateTimeStamp) As TagEventTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagDate]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagTime]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[FullTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ShortTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ReaderMode]
      ,vehicle.Name as SiteNumber  
     
  FROM [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT] MESSAGESRECEIVEDUNDELIMITEDTAGEVENT
  Join [dbo].[CM_MESSAGESRECEIVED] MESSAGESRECEIVED
    on  MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID = MESSAGESRECEIVED.ReceiveID
  join dbo.Allocation allocation
    on MESSAGESRECEIVED.FromSiteID =  allocation.DeviceID 
  join [Lookup].Vehicle vehicle
     on  allocation.VehicleDescriptionNrID  = vehicle.ID
  join [dbo].Employee_Tag_Number Employee
     on   MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = Employee.[Tag Number]
  join dbo.Employment_Status Empstatus
    on Employee.EmploymentStatus = Empstatus.Emp_Status_ID
  join dbo.FloridaPretoriaSchedule FloridaPTASchedule
    on   vehicle.ID = FloridaPTASchedule.VehicleID
    
where allocation.VehicleDescriptionNrID = vehicle.ID
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode = 1
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1
GO
/****** Object:  View [dbo].[vPassengerBullet]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vPassengerBullet]
As 

SELECT  distinct (Employee.Employee_Name) As Employee_Name
       ,Employee.[Employee Number] as EmployeeNumber
       ,Empstatus.Emp_Status_Description as EmploymentStatus
       ,Convert(date, MESSAGESRECEIVED.EventDateTime) As TagEventDate
       ,Convert(time, MESSAGESRECEIVED.EventDateTime) As TagEventTime
       ,Convert(date,BulletSchedule.[Date]) As ScheduleDate
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagDate]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagTime]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[FullTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ShortTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ReaderMode]
       ,bulletlocation.Name As [To]
      ,vehicle.Name as SiteNumber 
     
  FROM [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT] MESSAGESRECEIVEDUNDELIMITEDTAGEVENT
  Join [dbo].[CM_MESSAGESRECEIVED] MESSAGESRECEIVED
    on  MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID = MESSAGESRECEIVED.ReceiveID
  join dbo.Allocation allocation
    on MESSAGESRECEIVED.FromSiteID =  allocation.DeviceID 
  join [Lookup].Vehicle vehicle
     on  allocation.VehicleDescriptionNrID  = vehicle.ID
  join [dbo].Employee_Tag_Number Employee
     on   MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = Employee.[Tag Number]
  join dbo.Employment_Status Empstatus
    on Employee.EmploymentStatus = Empstatus.Emp_Status_ID
  join dbo.BulletSchedule BulletSchedule
    on   vehicle.ID = BulletSchedule.VehicleID
  join [Lookup].BulletLocation bulletlocation
     on  bulletlocation.ID = BulletSchedule.LocationID
     
where allocation.VehicleDescriptionNrID = vehicle.ID
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode = 0
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1
and Convert(date, MESSAGESRECEIVED.EventDateTime)  = Convert(date, BulletSchedule.[Date])
GO
/****** Object:  View [dbo].[vPassengerAfterNoonBullet]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vPassengerAfterNoonBullet]
As 

SELECT distinct Employee.Employee_Name As Employee_Name
       ,Employee.[Employee Number] as EmployeeNumber
       ,Empstatus.Emp_Status_Description as EmploymentStatus
       ,Convert(date, MESSAGESRECEIVED.EventDateTime) As TagEventDate
       ,Convert(time, MESSAGESRECEIVED.EventDateTime) As TagEventTime
       ,Convert(date,BulletScheduleArchive.[Date]) As ScheduleDate
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagDate]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[TagTime]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[FullTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ShortTagNumber]
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime
       ,MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.[ReaderMode]
       ,bulletlocation.Name As [To]
      ,vehicle.Name as SiteNumber      
  FROM [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT] MESSAGESRECEIVEDUNDELIMITEDTAGEVENT
  Join [dbo].[CM_MESSAGESRECEIVED] MESSAGESRECEIVED
    on  MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID = MESSAGESRECEIVED.ReceiveID
  join dbo.Allocation allocation
    on MESSAGESRECEIVED.FromSiteID =  allocation.DeviceID 
  join [Lookup].Vehicle vehicle
     on  allocation.VehicleDescriptionNrID  = vehicle.ID
  join [dbo].Employee_Tag_Number Employee
     on   MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = Employee.[Tag Number]
  join dbo.Employment_Status Empstatus
    on Employee.EmploymentStatus = Empstatus.Emp_Status_ID
  right join dbo.BulletScheduleArchive BulletScheduleArchive
    on   vehicle.ID = BulletScheduleArchive.VehicleID
  join [Lookup].BulletLocation bulletlocation
     on  bulletlocation.ID = BulletScheduleArchive.LocationID
where allocation.VehicleDescriptionNrID = vehicle.ID
and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode = 0
	and MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1
	and Convert(date, MESSAGESRECEIVED.EventDateTime)  = Convert(date, BulletScheduleArchive.[Date])
GO
/****** Object:  View [dbo].[vPassenger]    Script Date: 01/14/2016 19:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vPassenger]
As 

SELECT distinct (Employee.Employee_Name) As Employee_Name
       ,Employee.[Employee Number] as EmployeeNumber
      ,Empstatus.Emp_Status_Description as EmploymentStatus
      ,Convert(date, cm2.EventDateTime) As TagDate2
      ,Convert(time, cm2.EventDateTime) As TagTime2
      ,cm1.[TagDate]
      ,cm1.[TagTime]
      ,cm1.[FullTagNumber]
      ,cm1.[ShortTagNumber]
      ,cm1.Latitude
      ,cm1.GPSTime
      ,cm1.[ReaderMode]
      
      ,veh.Name as SiteNumber
      
      
  FROM [CellCopMessaging210].[dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT] cm1
  join [CellCopMessaging210].[dbo].[CM_MESSAGESRECEIVED] cm2
    on  cm1.ReceiveID = cm2.ReceiveID
  join [CellCopMessaging210].dbo.Allocation alloc
    on cm2.FromSiteID =  alloc.DeviceID 
    join CellCopMessaging210.[Lookup].Vehicle veh
    on  alloc.VehicleDescriptionNrID  = veh.ID
    join [CellCopMessaging210].[dbo].Employee_Tag_Number Employee
    on   cm1.ShortTagNumber = Employee.[Tag Number]
    join CellCopMessaging210.dbo.Employment_Status Empstatus
    on Employee.EmploymentStatus = Empstatus.Emp_Status_ID
    join [CellCopMessaging210].dbo.FloridaPretoriaSchedule flopta
    on   veh.ID = flopta.VehicleID
    
where alloc.VehicleDescriptionNrID = veh.ID
--and TagTime between '05:30'  and '06:55'
--and veh.Name = 'P008'
and cm1.ReaderMode = 1
--and cm1.TagDate = '30/11/15'
and cm1.Latitude  between '27.89900' and '29.90050' 
and cm1.GPSTime between '-26.15000' and '-26.20000'
GO
/****** Object:  View [dbo].[viewPassenger]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[viewPassenger]
As 
Select Distinct(Employee_Tag_Number.Employee_Name) As Employee_Name,
		Employment_Status.Emp_Status_Description,
		Convert(date, CM_MESSAGESRECEIVED.EventDateTime) As TagDate,
		Convert(time, CM_MESSAGESRECEIVED.EventDateTime) As TagTime,				
		AccessGranted = Case ISNULL(CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted, 0)
						When 0 Then 'No'
						Else 'Yes' End,
		AccessType.Name As AccessType,
		Employee_Tag_Number.[Employee Number],
		Employee_Tag_Number.[Full Tag Number],
		Employee_Tag_Number.[Tag Number],		
		CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude As Longitude,
		CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime As Latitude,
		CM_SITE.SiteNumber		
From [CellcopMessaging210].[dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT]
Join [CellcopMessaging210].[Lookup].[AccessType] AccessType
	On AccessType.ID = CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessType
Join [CellcopMessaging210].[dbo].[Employee_Tag_Number] Employee_Tag_Number 
	On Employee_Tag_Number.[Full Tag Number] = CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.FullTagNumber  
Join [CellcopMessaging210].[dbo].[CM_MESSAGESRECEIVED] CM_MESSAGESRECEIVED 
	On CM_MESSAGESRECEIVED.ReceiveID = CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID
Join [CellcopMessaging210].[dbo].[Allocation] Allocation 
	On Allocation.DeviceID = CM_MESSAGESRECEIVED.FromSiteID
Join [CellcopMessaging210].[dbo].[CM_SITE] CM_SITE
	On CM_SITE.SiteID = Allocation.DeviceID
Join [CellcopMessaging210].[dbo].[Employment_Status] Employment_Status
	On Employment_Status.Emp_Status_ID = Employee_Tag_Number.EmploymentStatus
GO
/****** Object:  StoredProcedure [dbo].[MESSAGESRECEIVEDUNDELIMITEDTAGEVENT]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MESSAGESRECEIVEDUNDELIMITEDTAGEVENT]
AS
BEGIN
	DECLARE @TABLERECEIVEDID NUMERIC(18, 0)
	DECLARE @TABLEMESSAGEIDENTIFIER NVARCHAR(50)	
	DECLARE @TABLEMESSAGETYPE NVARCHAR(50)	
	DECLARE @TABLETAGDATE NVARCHAR(50)
	DECLARE @TABLETAGTIME NVARCHAR(50)	
	DECLARE @TABLEFULLTAGNUMBER NVARCHAR(50)
	DECLARE @TABLESHORTTAGNUMBER NVARCHAR(50)
	DECLARE @TABLETAGPOS NVARCHAR(50)
	DECLARE @TABLEACCESSGRANTED NVARCHAR(50)
	DECLARE @TABLEREADERMODE NVARCHAR(50)
	DECLARE @TABLEACCESSTYPE NVARCHAR(50)
	DECLARE @TABLELOCKSTATUS NVARCHAR(50)
	DECLARE @TABLELONGITUDE NVARCHAR(50)
	DECLARE @TABLELATITUDE NVARCHAR(50)
	DECLARE @TABLEGPSTIME NVARCHAR(50)
		
	DECLARE @RECEIVED INT
	DECLARE CM_DATACURSOR CURSOR FOR 
	SELECT CM_MESSAGESRECEIVED.RECEIVEID
	FROM CM_MESSAGESRECEIVED	
	WHERE SUBSTRING(msgText, 1, 15) = 'TAGLOG:TAGEVENT'
	AND CM_MESSAGESRECEIVED.RECEIVEID
	NOT IN (SELECT CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.RECEIVEID FROM CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT)
	ORDER BY CM_MESSAGESRECEIVED.RECEIVEID;

	OPEN CM_DATACURSOR

	FETCH NEXT FROM CM_DATACURSOR 
	INTO @RECEIVED

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @Str NVARCHAR(MAX)
		SET @Str = (Select  
				'|' + Convert(Varchar(1000), [ReceiveID])  
				+  '|' + RTRIM(REPLACE(REPLACE(SUBSTRING(dbo.[CM_MESSAGESRECEIVED].msgText, 1, 200), ',', '|'), ';', ' ')) + '|' 
				From [dbo].[CM_MESSAGESRECEIVED] 
				Where RECEIVEID = @RECEIVED)

		DECLARE @Part NVARCHAR(MAX)
		DECLARE @IND INT
		DECLARE @INTLOCATION INT SET @INTLOCATION = 0
		SET @IND = CHARINDEX('|',@Str)
		DECLARE @END INT set @END = 0

		WHILE(@IND != LEN(@STR))
		BEGIN
			SET @INTLOCATION = @INTLOCATION + 1
			SET  @END = ISNULL(((CHARINDEX('|', @Str, @IND + 1)) - @IND - 1), 0)

			IF (@INTLOCATION = 1)
				SET @TABLERECEIVEDID = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 2)
				SET @TABLEMESSAGEIDENTIFIER   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 3)
				SET @TABLEMESSAGETYPE = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 4)
				SET @TABLETAGDATE  = (SUBSTRING(@Str, (@IND  + 1),  @END))											
			IF (@INTLOCATION = 5)
				SET @TABLETAGTIME  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 6)
				SET @TABLEFULLTAGNUMBER  = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 7)
				SET @TABLESHORTTAGNUMBER  = (SUBSTRING(@Str, (@IND  + 1),  @END))	
			IF (@INTLOCATION = 8)
				SET @TABLETAGPOS = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 9)
				SET @TABLEACCESSGRANTED   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 10)
				SET @TABLEREADERMODE  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 11)
				SET @TABLEACCESSTYPE  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 12)
				SET @TABLELOCKSTATUS  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 13)
				SET @TABLELONGITUDE  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 14)
				SET @TABLELATITUDE  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 15)
				SET @TABLEGPSTIME  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			
			SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0) 
		END
    
		--INSERT INTO NEWLY CREATED TABLE HERE
		INSERT INTO [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT]
			([ReceiveID],
				[MessageIdentifier],
				[MessageType],
				[TagDate],
				[TagTime],
				[FullTagNumber],
				[ShortTagNumber],
				[TagPos],
				[AccessGranted],
				[ReaderMode],
				[AccessType],
				[LockStatus],
				[Longitude],
				[Latitude],
				[GPSTime])
		VALUES
			(ISNULL(@TABLERECEIVEDID, 0),				
				UPPER(ISNULL(@TABLEMESSAGEIDENTIFIER, '')),
				ISNULL(@TABLEMESSAGETYPE, ''),
				ISNULL(@TABLETAGDATE, ''),
				ISNULL(@TABLETAGTIME, ''),
				ISNULL(@TABLEFULLTAGNUMBER, ''),
				ISNULL(@TABLESHORTTAGNUMBER, ''),
				ISNULL(@TABLETAGPOS, ''),
				ISNULL(@TABLEACCESSGRANTED, ''),
				ISNULL(@TABLEREADERMODE, ''),
				ISNULL(@TABLEACCESSTYPE, ''),
				ISNULL(@TABLELOCKSTATUS, ''),
				ISNULL(@TABLELONGITUDE, ''),
				ISNULL(@TABLELATITUDE, ''),
				ISNULL(@TABLEGPSTIME, ''))

		FETCH NEXT FROM CM_DATACURSOR 
		INTO @RECEIVED   
	END 
	CLOSE CM_DATACURSOR;
	DEALLOCATE CM_DATACURSOR;

END
GO
/****** Object:  StoredProcedure [dbo].[MESSAGESRECEIVEDUNDELIMITEDRXSMS]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MESSAGESRECEIVEDUNDELIMITEDRXSMS]
AS
BEGIN
    DELETE FROM CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS
	DECLARE @TABLERECEIVEDID NUMERIC(18, 0)
	DECLARE @TABLEMESSAGEIDENTIFIER NVARCHAR(50)	
	DECLARE @TABLEMESSAGETYPE NVARCHAR(50)	
	DECLARE @TABLESMSDATE NVARCHAR(50)
	DECLARE @TABLESMSTIME NVARCHAR(50)	
	DECLARE @TABLETYPEOFREPLY NVARCHAR(50)
	DECLARE @TABLENO NVARCHAR(50)
	DECLARE @TABLEAIRTIME NVARCHAR(50)
	DECLARE @TABLESMS NVARCHAR(50)
	DECLARE @TABLEDATA NVARCHAR(80)
	DECLARE @TABLEPOS NVARCHAR(80)
	DECLARE @TABLECELLNO NVARCHAR(80)
			
	DECLARE @RECEIVED INT
	DECLARE CM_DATACURSOR CURSOR FOR 
	SELECT CM_MESSAGESRECEIVED.RECEIVEID
	FROM CM_MESSAGESRECEIVED	
	WHERE SUBSTRING(msgText, 1, 12) = 'TAGLOG:RXSMS'
	AND msgText LIKE  '%USSD_REPLY%'
	AND CM_MESSAGESRECEIVED.RECEIVEID
	NOT IN (SELECT CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS.RECEIVEID FROM CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS)
	ORDER BY CM_MESSAGESRECEIVED.RECEIVEID;

	OPEN CM_DATACURSOR

	FETCH NEXT FROM CM_DATACURSOR 
	INTO @RECEIVED

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @Str NVARCHAR(MAX)
		SET @Str = (Select  '|' + Convert(Varchar(1000), [ReceiveID])  
                    +  '|' + RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(dbo.[CM_MESSAGESRECEIVED].msgText, 1, 200), ',', '|'), ';', ' '),'and','|'),'"',' ')) + '|' + CellPhone +'|'  
				From [dbo].[CM_MESSAGESRECEIVED] 
				Where RECEIVEID = @RECEIVED)

		DECLARE @Part NVARCHAR(MAX)
		DECLARE @IND INT
		DECLARE @INTLOCATION INT SET @INTLOCATION = 0
		SET @IND = CHARINDEX('|',@Str)
		DECLARE @END INT set @END = 0

		WHILE(@IND != LEN(@STR))
		BEGIN
			SET @INTLOCATION = @INTLOCATION + 1
			SET  @END = ISNULL(((CHARINDEX('|', @Str, @IND + 1)) - @IND - 1), 0)

			IF (@INTLOCATION = 1)
				SET @TABLERECEIVEDID = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 2)
				SET @TABLEMESSAGEIDENTIFIER   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 3)
				SET @TABLEMESSAGETYPE = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 4)
				SET @TABLESMSDATE  = (SUBSTRING(@Str, (@IND  + 1),  @END))											
			IF (@INTLOCATION = 5)
				SET @TABLESMSTIME  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 6)
				SET @TABLETYPEOFREPLY  = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 7)
				SET @TABLENO  = (SUBSTRING(@Str, (@IND  + 1),  @END))	
			IF (@INTLOCATION = 8)
				SET @TABLEAIRTIME = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 9)
				SET @TABLESMS   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 10)
				SET @TABLEDATA   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 11)
				SET @TABLEPOS   = (SUBSTRING(@Str, (@IND  + 1),  @END))	
			IF (@INTLOCATION = 12)
				SET @TABLECELLNO   = (SUBSTRING(@Str, (@IND  + 1),  @END))	
				
			
			SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0) 
		END
    
		--INSERT INTO NEWLY CREATED TABLE HERE
		INSERT INTO [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDRXSMS]
			   ([ReceiveID],
				[MessageIdentifier],
				[MessageType],
				[SMSDate],
				[SMSTime],
				[TypeOfReply],
				[NO],
				[AirtimeBalance],
				[SMSBalance],
				[DataBalance],
				[POS],
				[CellNo])
		VALUES
			(ISNULL(@TABLERECEIVEDID, 0),				
				UPPER(ISNULL(@TABLEMESSAGEIDENTIFIER, '')),
				ISNULL(@TABLEMESSAGETYPE, ''),
				ISNULL(@TABLESMSDATE, ''),
				ISNULL(@TABLESMSTIME, ''),
				ISNULL(@TABLETYPEOFREPLY, ''),
				ISNULL(@TABLENO, ''),
				ISNULL(@TABLEAIRTIME, ''),
				ISNULL(@TABLESMS, ''),
				ISNULL(@TABLEDATA, ''),
				ISNULL(@TABLEPOS, ''),
				ISNULL(@TABLECELLNO, ''))

		FETCH NEXT FROM CM_DATACURSOR 
		INTO @RECEIVED   
	END 
	CLOSE CM_DATACURSOR;
	DEALLOCATE CM_DATACURSOR;

END
GO
/****** Object:  StoredProcedure [dbo].[MESSAGESRECEIVEDUNDELIMITEDGPSEVENT]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MESSAGESRECEIVEDUNDELIMITEDGPSEVENT]
AS
BEGIN
	DECLARE @TABLERECEIVEDID NUMERIC(18, 0)
	DECLARE @TABLEMESSAGEIDENTIFIER NVARCHAR(50)	
	DECLARE @TABLEMESSAGETYPE NVARCHAR(50)	
	DECLARE @TABLETAGDATE NVARCHAR(50)
	DECLARE @TABLETAGTIME NVARCHAR(50)	
	DECLARE @TABLEGPSSTATUS NVARCHAR(50)
	DECLARE @TABLELONGITUDE NVARCHAR(50)
	DECLARE @TABLELATITUDE NVARCHAR(50)
	DECLARE @TABLEALTITUDE NVARCHAR(50)
	DECLARE @TABLESPEED NVARCHAR(50)
	DECLARE @TABLEDIRECTION NVARCHAR(50)
	DECLARE @TABLENOOFSTATELITES NVARCHAR(50)
		
	DECLARE @RECEIVED INT
	DECLARE CM_DATACURSOR CURSOR FOR 
	SELECT CM_MESSAGESRECEIVED.RECEIVEID
	FROM CM_MESSAGESRECEIVED	
	WHERE SUBSTRING(msgText, 1, 15) = 'TAGLOG:GPSEVENT'
	AND CM_MESSAGESRECEIVED.RECEIVEID
	NOT IN (SELECT CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT.RECEIVEID FROM CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT)
	ORDER BY CM_MESSAGESRECEIVED.RECEIVEID;

	OPEN CM_DATACURSOR

	FETCH NEXT FROM CM_DATACURSOR 
	INTO @RECEIVED

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @Str NVARCHAR(MAX)
		SET @Str = (Select  
				'|' + Convert(Varchar(1000), [ReceiveID])  
				+  '|' + RTRIM(REPLACE(REPLACE(SUBSTRING(dbo.[CM_MESSAGESRECEIVED].msgText, 1, 200), ',', '|'), ';', ' ')) + '|' 
				From [dbo].[CM_MESSAGESRECEIVED] 
				Where RECEIVEID = @RECEIVED)

		DECLARE @Part NVARCHAR(MAX)
		DECLARE @IND INT
		DECLARE @INTLOCATION INT SET @INTLOCATION = 0
		SET @IND = CHARINDEX('|',@Str)
		DECLARE @END INT set @END = 0

		WHILE(@IND != LEN(@STR))
		BEGIN
			SET @INTLOCATION = @INTLOCATION + 1
			SET  @END = ISNULL(((CHARINDEX('|', @Str, @IND + 1)) - @IND - 1), 0)

			IF (@INTLOCATION = 1)
				SET @TABLERECEIVEDID = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 2)
				SET @TABLEMESSAGEIDENTIFIER   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 3)
				SET @TABLEMESSAGETYPE = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 4)
				SET @TABLETAGDATE  = (SUBSTRING(@Str, (@IND  + 1),  @END))											
			IF (@INTLOCATION = 5)
				SET @TABLETAGTIME  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 6)
				SET @TABLEGPSSTATUS  = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 7)
				SET @TABLELONGITUDE  = (SUBSTRING(@Str, (@IND  + 1),  @END))	
			IF (@INTLOCATION = 8)
				SET @TABLELATITUDE = (SUBSTRING(@Str, (@IND  + 1),  @END))			
			IF (@INTLOCATION = 9)
				SET @TABLEALTITUDE   = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 10)
				SET @TABLESPEED  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 11)
				SET @TABLEDIRECTION  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			IF (@INTLOCATION = 12)
				SET @TABLENOOFSTATELITES  = (SUBSTRING(@Str, (@IND  + 1),  @END))
			
			SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0) 
		END
    
		--INSERT INTO NEWLY CREATED TABLE HERE
		INSERT INTO [dbo].[CM_MESSAGESRECEIVEDUNDELIMITEDGPSEVENT]
			([ReceiveID],
			  [MessageIdentifier],
			  [MessageType],
			  [TagDate],
			  [TagTime],
			  [GPSStatus],
			  [Longitude],
			  [Latitude],
			  [Altitude],
			  [Speed],
			  [Direction],
			  [NoOfStatelites])
		VALUES
			(ISNULL(@TABLERECEIVEDID, 0),				
				UPPER(ISNULL(@TABLEMESSAGEIDENTIFIER, '')),
				ISNULL(@TABLEMESSAGETYPE, ''),
				ISNULL(@TABLETAGDATE, ''),
				ISNULL(@TABLETAGTIME, ''),
				ISNULL(@TABLEGPSSTATUS, ''),
				ISNULL(@TABLELONGITUDE, ''),
				ISNULL(@TABLELATITUDE, ''),
				ISNULL(@TABLEALTITUDE, ''),
				ISNULL(@TABLESPEED, ''),
				ISNULL(@TABLEDIRECTION, ''),
				ISNULL(@TABLENOOFSTATELITES, ''))

		FETCH NEXT FROM CM_DATACURSOR 
		INTO @RECEIVED   
	END 
	CLOSE CM_DATACURSOR;
	DEALLOCATE CM_DATACURSOR;

END
GO
/****** Object:  StoredProcedure [dbo].[MESSAGESRECEIVEDUNDELIMITED]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MESSAGESRECEIVEDUNDELIMITED]
AS
BEGIN
	DECLARE @TABLERECEIVEDID NUMERIC(18, 0)

	DECLARE @TABLETRIGGEREDBY NVARCHAR(100)
	DECLARE @TABLECHANNEL NVARCHAR(100)
	DECLARE @TABLEVALUE NVARCHAR(100)
	DECLARE @TABLEDATE NVARCHAR(100)
	DECLARE @TABLETIME NVARCHAR(100)
    
    DECLARE @TABLECHARGERVOLTAGE NVARCHAR(100)
	DECLARE @TABLEBATTERYCHARGEVOLTAGE NVARCHAR(100)
	DECLARE @TABLEBATTERYLOADVOLTAGE NVARCHAR(100)
    DECLARE @TABLEMONITORMODE NVARCHAR(100)

	DECLARE @TABLEINPUT1 NVARCHAR(100)
	DECLARE @TABLEINPUT2 NVARCHAR(100)
	DECLARE @TABLEINPUT3 NVARCHAR(100)
	DECLARE @TABLEINPUT4 NVARCHAR(100)	
	DECLARE @TABLEINPUT5 NVARCHAR(100)
	
	DECLARE @TABLEOUTPUT1 NVARCHAR(100)
	DECLARE @TABLEOUTPUT2 NVARCHAR(100)
	

	DECLARE @TABLEANALOG1 NVARCHAR(100)
	DECLARE @TABLEANALOG2 NVARCHAR(100)
	
	DECLARE @TABLEHOURMETER1 NVARCHAR(100)
	DECLARE @TABLEHOURMETER2 NVARCHAR(100)
	DECLARE @TABLEHOURMETER3 NVARCHAR(100)
	DECLARE @TABLEHOURMETER4 NVARCHAR(100)
	DECLARE @TABLEHOURMETER5 NVARCHAR(100)
	
	
	DECLARE @TABLECOUNTER1 NVARCHAR(100)
	DECLARE @TABLECOUNTER2 NVARCHAR(100)
	DECLARE @TABLECOUNTER3 NVARCHAR(100)
	DECLARE @TABLECOUNTER4 NVARCHAR(100)
	DECLARE @TABLECOUNTER5 NVARCHAR(100)
	
	DECLARE @TABLELADEG NVARCHAR(100)
	DECLARE @TABLELONDEG NVARCHAR(100)
	DECLARE @TABLEALTITUDE NVARCHAR(100)
	DECLARE @TABLESPEED NVARCHAR(100)
	DECLARE @TABLEGPSTIME NVARCHAR(100)
	DECLARE @TABLEDIRECTION NVARCHAR(100)
	DECLARE @TABLEVELOCITY NVARCHAR(100)
	DECLARE @TABLENOOFSAT NVARCHAR(100)
	DECLARE @TABLEEND NVARCHAR(100)
	
	
	

	DECLARE @RECEIVED INT
	DECLARE CM_DATACURSOR CURSOR FOR 
	SELECT CM_MESSAGESRECEIVED.RECEIVEID
	FROM CM_MESSAGESRECEIVED	
	WHERE LEN(MSGTEXT) > 185
	AND CM_MESSAGESRECEIVED.RECEIVEID Not In (102, 128) 
	AND CM_MESSAGESRECEIVED.RECEIVEID	
	NOT IN (SELECT CM_MESSAGESRECEIVEDUNDELIMITED.RECEIVEID FROM CM_MESSAGESRECEIVEDUNDELIMITED)
	ORDER BY CM_MESSAGESRECEIVED.RECEIVEID DESC;

	OPEN CM_DATACURSOR

	FETCH NEXT FROM CM_DATACURSOR 
	INTO @RECEIVED

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @Str NVARCHAR(MAX)
		SET @Str = (Select  
				'|' + Convert(Varchar(1000), [ReceiveID])  
				+  '|' + RTRIM(REPLACE(REPLACE(SUBSTRING(dbo.CM_MESSAGESRECEIVED.msgText, 26, 205), ',', '|'), ';', ' ')) + '|' 
				From [CellcopMessaging210].[dbo].[CM_MESSAGESRECEIVED] 
				Where RECEIVEID = @RECEIVED)

		DECLARE @Part NVARCHAR(MAX)
		DECLARE @IND INT
		DECLARE @INTLOCATION INT SET @INTLOCATION = 0
		SET @IND = CHARINDEX('|',@Str)
		DECLARE @EIND INT set @EIND = 0

		WHILE(@IND != LEN(@STR))
		BEGIN
			SET @INTLOCATION = @INTLOCATION + 1
			SET  @EIND = ISNULL(((CHARINDEX('|', @Str, @IND + 1)) - @IND - 1), 0)

			IF (@INTLOCATION = 1)
				SET @TABLERECEIVEDID = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 2)
				SET @TABLETRIGGEREDBY = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 3)
				SET @TABLECHANNEL = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 4)
				SET @TABLEVALUE = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 5)
				SET @TABLEDATE   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))			
			IF (@INTLOCATION = 6)
				SET @TABLETIME  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 7)
				SET @TABLECHARGERVOLTAGE  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 8)
				SET @TABLEBATTERYCHARGEVOLTAGE = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 9)
				SET @TABLEBATTERYLOADVOLTAGE   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 10)
				SET @TABLEMONITORMODE = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 11)
				SET @TABLEINPUT1  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 12)
				SET @TABLEINPUT2  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 13)
				SET @TABLEINPUT3  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))			
			IF (@INTLOCATION = 14)
				SET @TABLEINPUT4 = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 15)
				SET @TABLEINPUT5   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 16)
				SET @TABLEOUTPUT1  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 17)
				SET @TABLEOUTPUT2  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 18)
				SET @TABLEANALOG1  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 19)
				SET @TABLEANALOG2  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 20)
				SET @TABLEHOURMETER1  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 21)
				SET @TABLEHOURMETER2  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 22)
				SET @TABLEHOURMETER3  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 23)
				SET @TABLEHOURMETER4  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))			
			IF (@INTLOCATION = 24)
				SET @TABLEHOURMETER5   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 25)
				SET @TABLECOUNTER1   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 26)
				SET @TABLECOUNTER2   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 27)
				SET @TABLECOUNTER3   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))			
			IF (@INTLOCATION = 28)	
				SET @TABLECOUNTER4 = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 29)
				SET @TABLECOUNTER5  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 30)
				SET @TABLELADEG  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 31)
				SET @TABLELONDEG  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 32)
				SET @TABLEALTITUDE  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 33)
				SET @TABLESPEED  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 34)	
				SET @TABLEGPSTIME  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 35)
				SET @TABLEDIRECTION  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))						
			IF (@INTLOCATION = 36)
				SET @TABLEVELOCITY = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 37)
				SET @TABLENOOFSAT  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 38)
				SET @TABLEEND  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			
				
			--SELECT (SUBSTRING(@Str, (@IND  + 1),  @EIND)) 'FieldData'
			SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0) 
		END
    
		--INSERT INTO NEWLY CREATED TABLE HERE
		INSERT INTO [dbo].[CM_MESSAGESRECEIVEDUNDELIMITED]
           ([ReceiveID]
           ,[TriggeredBy]
           ,[Channel]
           ,[Value]
           ,[Date]
           ,[Time]
           ,[ChargeVoltage]
           ,[BatteryChargeVoltage]
           ,[BatteryLoadVoltage]
           ,[Monitormode]
           ,[Input1]
           ,[Input2]
           ,[Input3]
           ,[Input4]
           ,[Input5]
           ,[Output1]
           ,[Output2]
           ,[Analog1]
           ,[Analog2]
           ,[HourMeter1]
           ,[HourMeter2]
           ,[HourMeter3]
           ,[HourMeter4]
           ,[HourMeter5]
           ,[Counter1]
           ,[Counter2]
           ,[Counter3]
           ,[Counter4]
           ,[Counter5]
           ,[LATDeg]
           ,[LONDeg]
           ,[Altitude]
           ,[Speed]
           ,[GPSTime]
           ,[Direction]
           ,[Velocity]
           ,[NoOfSat]
           ,[END])
     VALUES
           (@TABLERECEIVEDID ,
			@TABLETRIGGEREDBY ,
			@TABLECHANNEL ,
			@TABLEVALUE ,
			@TABLEDATE ,
			@TABLETIME , 
			@TABLECHARGERVOLTAGE ,
			@TABLEBATTERYCHARGEVOLTAGE ,
			@TABLEBATTERYLOADVOLTAGE ,
			@TABLEMONITORMODE ,
			@TABLEINPUT1 ,
			@TABLEINPUT2 ,
			@TABLEINPUT3 ,
			@TABLEINPUT4 ,	
			@TABLEINPUT5 ,	
			@TABLEOUTPUT1 ,
			@TABLEOUTPUT2 ,
			@TABLEANALOG1 ,
			@TABLEANALOG2 ,
			@TABLEHOURMETER1 ,
			@TABLEHOURMETER2 ,
			@TABLEHOURMETER3 ,
			@TABLEHOURMETER4 ,
			@TABLEHOURMETER5 ,
			@TABLECOUNTER1 ,
			@TABLECOUNTER2 ,
			@TABLECOUNTER3 ,
			@TABLECOUNTER4 ,
			@TABLECOUNTER5 ,
			@TABLELADEG ,
			@TABLELONDEG ,
			@TABLEALTITUDE ,
			@TABLESPEED ,
			@TABLEGPSTIME ,
			@TABLEDIRECTION ,
			@TABLEVELOCITY ,
			@TABLENOOFSAT ,
			@TABLEEND)

		FETCH NEXT FROM CM_DATACURSOR 
		INTO @RECEIVED   
	END 
	CLOSE CM_DATACURSOR;
	DEALLOCATE CM_DATACURSOR;

END
GO
/****** Object:  View [dbo].[Shuttle_User_VIEW]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Shuttle_User_VIEW]
AS
SELECT     dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagDate, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.TagTime, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.FullTagNumber, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessType, dbo.CM_SITE.Name, dbo.CM_SITE.SiteNumber, 
                      dbo.Employee_Tag_Number.[Employee Number], dbo.Employee_Tag_Number.EmploymentStatus, dbo.Employee_Tag_Number.Employee_Name, 
                      dbo.Employment_Status.Emp_Status_Description, dbo.Shuttle_Type.Shuttle_Description, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID, 
                      dbo.CM_MESSAGESRECEIVED.SendDateTime, dbo.Employee_Tag_Number.[Tag Number], dbo.CM_MESSAGESRECEIVED.TheDateTimeStamp, dbo.CM_SITE.SiteID, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.Latitude AS Longitude, dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.GPSTime AS Latitude, 
                      dbo.CM_MESSAGESRECEIVED.EventDateTime
FROM         dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT INNER JOIN
                      dbo.CM_MESSAGESRECEIVED ON dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReceiveID = dbo.CM_MESSAGESRECEIVED.ReceiveID INNER JOIN
                      dbo.CM_SITE ON dbo.CM_MESSAGESRECEIVED.FromSiteID = dbo.CM_SITE.SiteID INNER JOIN
                      dbo.Employee_Tag_Number ON dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ShortTagNumber = dbo.Employee_Tag_Number.[Tag Number] INNER JOIN
                      dbo.Employment_Status ON dbo.Employee_Tag_Number.EmploymentStatus = dbo.Employment_Status.Emp_Status_ID INNER JOIN
                      dbo.Shuttle_Type ON dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.ReaderMode = dbo.Shuttle_Type.Shuttle_Type
WHERE     (dbo.CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT.AccessGranted = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[16] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CM_MESSAGESRECEIVEDUNDELIMITEDTAGEVENT"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 359
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 13
               Left = 330
               Bottom = 339
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 15
               Left = 689
               Bottom = 293
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee_Tag_Number"
            Begin Extent = 
               Top = 10
               Left = 956
               Bottom = 293
               Right = 1339
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employment_Status"
            Begin Extent = 
               Top = 331
               Left = 706
               Bottom = 456
               Right = 939
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Shuttle_Type"
            Begin Extent = 
               Top = 352
               Left = 328
               Bottom = 477
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shuttle_User_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shuttle_User_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Shuttle_User_VIEW'
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertMessageSend]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertMessageSend]
@ToSiteID int,
@cellno varchar(20),
@MsgText varchar(160)
AS


   BEGIN
               
        --INSERT
        INSERT INTO [dbo].CM_MESSAGESSEND
               (ToSiteID,CellPhone,MsgText)
        VALUES (@ToSiteID,@cellno,@MsgText) 
        SELECT @@IDENTITY
   END
GO
/****** Object:  StoredProcedure [dbo].[spa_GetPassengerByDeparturePTA]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spa_GetPassengerByDeparturePTA] 
				@TagDate datetime = NULL,
				@TagTime datetime = NULL,
				@SiteNumber varchar(20) = Null
As
Select *
From vPassengerPtaToFlorida
Where 
vPassengerPtaToFlorida.SiteNumber = @SiteNumber
And vPassengerPtaToFlorida.TagEventDate = @TagDate
And (vPassengerPtaToFlorida.TagEventTime Between Convert(time, DATEADD(minute,-30, @TagTime)) And Convert(time, DATEADD(minute, 15, @TagTime)))
Order By TagEventTime
GO
/****** Object:  StoredProcedure [dbo].[spa_GetPassengerByDepartureFlorida]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spa_GetPassengerByDepartureFlorida] 
				@TagDate datetime = NULL,
				@TagTime datetime = NULL,
				@SiteNumber varchar(20) = Null
As
Select *
From vPassengerFloridaToPTA
Where 
vPassengerFloridaToPTA.SiteNumber = @SiteNumber
And vPassengerFloridaToPTA.TagEventDate = @TagDate
And (vPassengerFloridaToPTA.TagEventTime Between Convert(time, DATEADD(minute,-30, @TagTime)) And Convert(time, DATEADD(minute, 15, @TagTime)))
Order By TagEventTime
GO
/****** Object:  StoredProcedure [dbo].[spa_GetPassengerByDeparture]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spa_GetPassengerByDeparture] 
				@TagDate datetime = NULL,
				@TagTime datetime = NULL,
				@SiteNumber varchar(20) = Null
As
Select *
From viewPassenger
Where 
viewPassenger.SiteNumber = @SiteNumber
And viewPassenger.TagDate = @TagDate
And (viewPassenger.TagTime Between Convert(time, DATEADD(minute,-30, @TagTime)) And Convert(time, DATEADD(minute, 15, @TagTime)))
Order By TagTime
GO
/****** Object:  StoredProcedure [dbo].[spa_GetPassengerBullet]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spa_GetPassengerBullet] 
				@TagDate datetime = NULL,
				@TagTime datetime = NULL,
				@To varchar(20) = Null
As
If(@TagDate = CONVERT(date,GETDATE()))
  begin
     Select *
           From vPassengerBullet
     Where 
         vPassengerBullet.[To] = @To
     And vPassengerBullet.TagEventDate = @TagDate
     And (vPassengerBullet.TagEventTime Between Convert(time, DATEADD(minute,-30, @TagTime)) And Convert(time, DATEADD(minute, 15, @TagTime)))
    Order By TagEventTime
   end
else
  begin
        Select *
           From vPassengerAfterNoonBullet
        Where 
             vPassengerAfterNoonBullet.[To] = @To 
        And vPassengerAfterNoonBullet.ScheduleDate = @TagDate
        And (vPassengerAfterNoonBullet.TagEventTime Between Convert(time, DATEADD(minute,-30, @TagTime)) And Convert(time, DATEADD(minute, 15, @TagTime)))
        Order By TagEventTime
   end
GO
/****** Object:  StoredProcedure [dbo].[FloridaToPretoriaUNISA_Pass_List]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FloridaToPretoriaUNISA_Pass_List] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time,
	@Shuttle_TimeTo time,
	@nDate varchar(20)
	
	

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	

SELECT SendDateTime, Employee_Name, [Employee Number], SiteNumber, Name, ShortTagNumber, TagTime, EmploymentStatus, TagDate, Shuttle_Description, 
       Emp_Status_Description, TheDateTimeStamp, SiteID,EventDateTime
       
FROM     Shuttle_User_VIEW

WHERE  

        (SiteID  = @Shuttle_ID) AND 

         CAST(EventDateTime AS time) Between Dateadd(Minute,-30,@Shuttle_TimeF) AND Dateadd(Minute,10,@Shuttle_TimeF) AND
        (YEAR(CONVERT(VARCHAR(20), EventDateTime, 101)) = YEAR(CONVERT(VARCHAR(20), @nDate, 121))) AND 
        (MONTH(CONVERT(VARCHAR(20), EventDateTime, 101))= MONTH(CONVERT(VARCHAR(20), @nDate, 121))) AND 
        (DAY(CONVERT(VARCHAR(20), EventDateTime, 101)) = DAY(CONVERT(VARCHAR(20), @nDate, 121)))
        
             
END
GO
/****** Object:  StoredProcedure [dbo].[PretoriaToFloridaUNISA_Pass_List]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PretoriaToFloridaUNISA_Pass_List] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time,
	@Shuttle_TimeTo time,
	@mDate varchar(20)
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  
SELECT SendDateTime, Employee_Name, [Employee Number], SiteNumber, Name, ShortTagNumber, TagTime, EmploymentStatus, TagDate, Shuttle_Description, 
       Emp_Status_Description, TheDateTimeStamp, SiteID,EventDateTime
       
FROM     Shuttle_User_VIEW

WHERE  

        (SiteID  = @Shuttle_ID) AND 

         CAST(EventDateTime AS time) Between Dateadd(Minute,-30,@Shuttle_TimeF) AND Dateadd(Minute,10,@Shuttle_TimeF) AND
        (YEAR(CONVERT(VARCHAR(20), EventDateTime, 101)) = YEAR(CONVERT(VARCHAR(20), @mDate, 121))) AND 
        (MONTH(CONVERT(VARCHAR(20), EventDateTime, 101))= MONTH(CONVERT(VARCHAR(20), @mDate, 121))) AND 
        (DAY(CONVERT(VARCHAR(20), EventDateTime, 101)) = DAY(CONVERT(VARCHAR(20), @mDate, 121)))
END
GO
/****** Object:  StoredProcedure [dbo].[PretoriaToFlorida_Pass_List]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PretoriaToFlorida_Pass_List] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time,
	@Shuttle_TimeTo time,
	@mDate varchar(20)
	
	
	
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	

SELECT SendDateTime,  Employee_Name, [Employee Number], SiteNumber, Name, 
                  ShortTagNumber, TagTime, EmploymentStatus, TagDate, Shuttle_Description, Emp_Status_Description, TheDateTimeStamp,EventDateTime
FROM     Shuttle_User_VIEW
WHERE   (SiteID  = @Shuttle_ID) AND 
 
         CAST(EventDateTime AS time) Between Dateadd(Minute,-30,@Shuttle_TimeF) AND Dateadd(Minute,10,@Shuttle_TimeF) AND
        (YEAR(CONVERT(VARCHAR(20), EventDateTime, 101)) = YEAR(CONVERT(VARCHAR(20), @mDate, 121))) AND 
        (MONTH(CONVERT(VARCHAR(20), EventDateTime, 101))= MONTH(CONVERT(VARCHAR(20), @mDate, 121))) AND 
        (DAY(CONVERT(VARCHAR(20), EventDateTime, 101)) = DAY(CONVERT(VARCHAR(20), @mDate, 121)))
	
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[FloridaToPretoria_Pass_List]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FloridaToPretoria_Pass_List] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time,
	@Shuttle_TimeTo time,
	@nDate varchar(20)
	
	

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

SELECT SendDateTime, Employee_Name, [Employee Number], SiteNumber, Name, ShortTagNumber, TagTime, EmploymentStatus, TagDate, Shuttle_Description, 
       Emp_Status_Description, TheDateTimeStamp, SiteID,EventDateTime
       
FROM     Shuttle_User_VIEW

WHERE  

        (SiteID  = @Shuttle_ID) AND 

      
         CAST(EventDateTime AS time) Between Dateadd(Minute,-30,@Shuttle_TimeF) AND Dateadd(Minute,10,@Shuttle_TimeF) AND
        (YEAR(CONVERT(VARCHAR(20), EventDateTime, 101)) = YEAR(CONVERT(VARCHAR(20), @nDate, 121))) AND 
        (MONTH(CONVERT(VARCHAR(20), EventDateTime, 101))= MONTH(CONVERT(VARCHAR(20), @nDate, 121))) AND 
        (DAY(CONVERT(VARCHAR(20), EventDateTime, 101)) = DAY(CONVERT(VARCHAR(20), @nDate, 121)))
        
      
        
END
GO
/****** Object:  StoredProcedure [dbo].[BULLET_Pass_List_History]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BULLET_Pass_List_History] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time,
	--@Shuttle_TimeTo time,
	@nDate varchar(20),
	@Shuttle_T varchar(7)
	
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	


        
SELECT DISTINCT [Time] AS triptime, Location, SiteID, Vehicle_Name, [Date], [Tag Number], [Employee Number], Employee_Name, Emp_Status_Description, TheDateTimeStamp, Latitude, 
                  Longitude, ReaderMode, AccessGranted, TagTime, TagDate, Bullet,eventdatetime
FROM     Bullet_Users_Historical_View
WHERE  (SiteID = @Shuttle_ID) AND 
        CAST(eventdatetime AS time) Between Dateadd(Minute,-10,@Shuttle_TimeF) AND Dateadd(Minute,5,@Shuttle_TimeF) and
         ReaderMode = 0  and
       --(CAST(TheDateTimeStamp AS time) <= Dateadd(Minute,30,@Shuttle_TimeF)) AND
       (YEAR(CONVERT(VARCHAR(20), eventdatetime, 101)) = YEAR(CONVERT(VARCHAR(20), @nDate, 121))) AND 
       (MONTH(CONVERT(VARCHAR(20), eventdatetime, 101)) = MONTH(CONVERT(VARCHAR(20), @nDate, 121))) AND 
       (DAY(CONVERT(VARCHAR(20), eventdatetime,   101)) = DAY(CONVERT(VARCHAR(20), @nDate, 121)))  And
       [Time]   = @Shuttle_T
       

ORDER BY TagTime 
        
END
GO
/****** Object:  StoredProcedure [dbo].[BULLET_Pass_List]    Script Date: 01/14/2016 19:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josiah Senona>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BULLET_Pass_List] 
	-- Add the parameters for the stored procedure here
	@Shuttle_ID nvarchar(10),
	@Shuttle_TimeF time(7),
	--@Shuttle_TimeTo time,
	@nDate varchar(20),
	@Shuttle_T varchar(7)
	
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	


        
SELECT [Time] AS triptime, Location, SiteID, Vehicle_Name, [Date], [Tag Number], [Employee Number], Employee_Name, Emp_Status_Description, TheDateTimeStamp, Latitude, 
                  Longitude, ReaderMode, AccessGranted, TagTime, TagDate, Bullet,EventDateTime
FROM     Bullet_Users_View
WHERE  (SiteID = @Shuttle_ID) AND 
        CAST(EventDateTime AS time(7)) Between Dateadd(Minute,-10,@Shuttle_TimeF) AND Dateadd(Minute,5,@Shuttle_TimeF) and
         
         ReaderMode = 0  and
     
       (YEAR(CONVERT(VARCHAR(20), EventDateTime, 101)) = YEAR(CONVERT(VARCHAR(20), @nDate, 121))) AND 
       (MONTH(CONVERT(VARCHAR(20), EventDateTime, 101)) = MONTH(CONVERT(VARCHAR(20), @nDate, 121))) AND 
       (DAY(CONVERT(VARCHAR(20), EventDateTime,   101)) = DAY(CONVERT(VARCHAR(20), @nDate, 121)))  AND 
   
       [Time]   = @Shuttle_T
       
 
       
ORDER BY TagTime 
     
    
END
GO
/****** Object:  Default [DF_CM_MESSAGESEQUENCE_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_MESSAGESEQUENCE] ADD  CONSTRAINT [DF_CM_MESSAGESEQUENCE_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_Name]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_ConMode]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_ConMode]  DEFAULT ('') FOR [ConMode]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_ConType]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_ConType]  DEFAULT ('') FOR [ConType]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_IP]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_IP]  DEFAULT ('') FOR [IP]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_DNSName]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_DNSName]  DEFAULT ('') FOR [DNSName]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_DNS1]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_DNS1]  DEFAULT ('') FOR [DNS1]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_DNS2]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_DNS2]  DEFAULT ('') FOR [DNS2]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_APN]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_APN]  DEFAULT ('') FOR [APN]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_APNLogin]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_APNLogin]  DEFAULT ('') FOR [APNLogin]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_APNPWD]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_APNPWD]  DEFAULT ('') FOR [APNPWD]
GO
/****** Object:  Default [DF_CM_GPRSSETTINGS_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSSETTINGS] ADD  CONSTRAINT [DF_CM_GPRSSETTINGS_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_GPRSLOG_DateTime]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_DateTime]  DEFAULT ('') FOR [DateTime]
GO
/****** Object:  Default [DF_CM_GPRSLOG_PortNumber]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_PortNumber]  DEFAULT ('') FOR [PortNumber]
GO
/****** Object:  Default [DF_CM_GPRSLOG_SiteID]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_SiteID]  DEFAULT ((-1)) FOR [SiteID]
GO
/****** Object:  Default [DF_CM_GPRSLOG_SiteName]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_SiteName]  DEFAULT ('') FOR [SiteName]
GO
/****** Object:  Default [DF_CM_GPRSLOG_Cellnumber]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_Cellnumber]  DEFAULT ('') FOR [Cellnumber]
GO
/****** Object:  Default [DF_CM_GPRSLOG_GPRSPWD]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_GPRSPWD]  DEFAULT ('') FOR [GPRSPWD]
GO
/****** Object:  Default [DF_CM_GPRSLOG_SIMIMI]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_SIMIMI]  DEFAULT ('') FOR [SIMIMI]
GO
/****** Object:  Default [DF_CM_GPRSLOG_GPRSPOLEID]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_GPRSPOLEID]  DEFAULT ('') FOR [PoleID]
GO
/****** Object:  Default [DF_CM_GPRSLOG_IMEI1]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_IMEI1]  DEFAULT ('') FOR [IMEI]
GO
/****** Object:  Default [DF_CM_GPRSLOG_loginCode]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_loginCode]  DEFAULT ('') FOR [LoginCode]
GO
/****** Object:  Default [DF_CM_GPRSLOG_LoginStatus]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_LoginStatus]  DEFAULT ('') FOR [LoginStatus]
GO
/****** Object:  Default [DF_CM_GPRSLOG_CellCopSerialNo]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_CellCopSerialNo]  DEFAULT ('') FOR [CellCopSerialNo]
GO
/****** Object:  Default [DF_CM_GPRSLOG_RealTimeClock]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_RealTimeClock]  DEFAULT ('') FOR [RealTimeClock]
GO
/****** Object:  Default [DF_CM_GPRSLOG_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GPRSLOG] ADD  CONSTRAINT [DF_CM_GPRSLOG_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Name]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_CM_GATEWAYS_SerialNo]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_SerialNo]  DEFAULT ('') FOR [SerialNo]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Settings]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Settings]  DEFAULT ('') FOR [Settings]
GO
/****** Object:  Default [DF_CM_GATEWAYS_PIN]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_PIN]  DEFAULT ('') FOR [PIN]
GO
/****** Object:  Default [DF_CM_GATEWAYS_CommPort]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_CommPort]  DEFAULT ('') FOR [CommPort]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Interval]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Interval]  DEFAULT ((100)) FOR [Interval]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Enabled]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
/****** Object:  Default [DF_CM_GATEWAYS_CellNumber]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_CellNumber]  DEFAULT ('') FOR [CellNumber]
GO
/****** Object:  Default [DF_CM_GATEWAYS_MsgMissedCounter]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_MsgMissedCounter]  DEFAULT ((0)) FOR [MsgMissedCounter]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TotalMsgSendCount]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TotalMsgSendCount]  DEFAULT ((0)) FOR [MsgSendCounter]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TotalMsgReceivedCount]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TotalMsgReceivedCount]  DEFAULT ((0)) FOR [MsgReportCounter]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TotalMissedCallCount]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TotalMissedCallCount]  DEFAULT ((0)) FOR [MsgInternalCounter]
GO
/****** Object:  Default [DF_CM_GATEWAYS_CounterDTStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_CounterDTStamp]  DEFAULT (getdate()) FOR [CounterDTStamp]
GO
/****** Object:  Default [DF_CM_GATEWAYS_VersionNo]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_VersionNo]  DEFAULT ('') FOR [VersionNo]
GO
/****** Object:  Default [DF_CM_GATEWAYS_IMEI]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_IMEI]  DEFAULT ('') FOR [IMEI]
GO
/****** Object:  Default [DF_CM_GATEWAYS_CompileDate]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_CompileDate]  DEFAULT ('') FOR [CompileDate]
GO
/****** Object:  Default [DF_CM_GATEWAYS_StatusDTStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_StatusDTStamp]  DEFAULT (getdate()) FOR [StatusDTStamp]
GO
/****** Object:  Default [DF_CM_GATEWAYS_SwitchPhoneOffOnTamper]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_SwitchPhoneOffOnTamper]  DEFAULT ((0)) FOR [SwitchPhoneOffOnTamper]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Cell1]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Cell1]  DEFAULT ('') FOR [Cell1]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Cell2]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Cell2]  DEFAULT ('') FOR [Cell2]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Cell3]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Cell3]  DEFAULT ('') FOR [Cell3]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmTimePCDisconnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmTimePCDisconnected]  DEFAULT ((300)) FOR [AlarmTimePCDisconnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmTimePCConnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmTimePCConnected]  DEFAULT ((300)) FOR [AlarmTimePCConnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmTimePowerOff]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmTimePowerOff]  DEFAULT ((300)) FOR [AlarmTimePowerOff]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmTimePowerOn]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmTimePowerOn]  DEFAULT ((300)) FOR [AlarmTimePowerOn]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmMsgTamper]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmMsgTamper]  DEFAULT ('PC-SMS Tamper') FOR [AlarmMsgTamper]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmMsgPCDisconnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmMsgPCDisconnected]  DEFAULT ('Cellcop Messaging Died') FOR [AlarmMsgPCDisconnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmMsgPCConnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmMsgPCConnected]  DEFAULT ('Cellcop Messaging Alive') FOR [AlarmMsgPCConnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmMsgPowerOff]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmMsgPowerOff]  DEFAULT ('Power Failure Occured') FOR [AlarmMsgPowerOff]
GO
/****** Object:  Default [DF_CM_GATEWAYS_AlarmMsgPowerOn]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_AlarmMsgPowerOn]  DEFAULT ('Power Restored') FOR [AlarmMsgPowerOn]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Alarm2Tamper]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Alarm2Tamper]  DEFAULT ('000') FOR [Alarm2Tamper]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Alarm2PCDisconnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Alarm2PCDisconnected]  DEFAULT ('000') FOR [Alarm2PCDisconnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Alarm2PCConnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Alarm2PCConnected]  DEFAULT ('000') FOR [Alarm2PCConnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Alarm2PowerOff]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Alarm2PowerOff]  DEFAULT ('000') FOR [Alarm2PowerOff]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Alarm2PowerOn]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Alarm2PowerOn]  DEFAULT ('000') FOR [Alarm2PowerOn]
GO
/****** Object:  Default [DF_CM_GATEWAYS_RFStrengh]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_RFStrengh]  DEFAULT ((0)) FOR [RFStrengh]
GO
/****** Object:  Default [DF_CM_GATEWAYS_PhonePower]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_PhonePower]  DEFAULT ('B') FOR [PhonePower]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Battery]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Battery]  DEFAULT ((0)) FOR [Battery]
GO
/****** Object:  Default [DF_CM_GATEWAYS_BatteryVal]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_BatteryVal]  DEFAULT ((0)) FOR [BatteryVal]
GO
/****** Object:  Default [DF_CM_GATEWAYS_Charger]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_Charger]  DEFAULT ((0)) FOR [Charger]
GO
/****** Object:  Default [DF_CM_GATEWAYS_ChargerVal]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_ChargerVal]  DEFAULT ((0)) FOR [ChargerVal]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TamperLight]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TamperLight]  DEFAULT ((0)) FOR [TamperLight]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TamperLightVal]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TamperLightVal]  DEFAULT ((0)) FOR [TamperLightVal]
GO
/****** Object:  Default [DF_CM_GATEWAYS_GPRSConnected]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_GPRSConnected]  DEFAULT ((0)) FOR [PCSMSConnected]
GO
/****** Object:  Default [DF_CM_GATEWAYS_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_GATEWAYS] ADD  CONSTRAINT [DF_CM_GATEWAYS_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_CONNECTIONTYPE_Name]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_CONNECTIONTYPE] ADD  CONSTRAINT [DF_CM_CONNECTIONTYPE_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_COMMUNICATORTYPE_Description]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_COMMUNICATORTYPE] ADD  CONSTRAINT [DF_COMMUNICATORTYPE_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_COMMUNICATORTYPE_Version]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CM_COMMUNICATORTYPE] ADD  CONSTRAINT [DF_COMMUNICATORTYPE_Version]  DEFAULT ('') FOR [Version]
GO
/****** Object:  Default [DF_CA_USERS_Enabled]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CA_USERS] ADD  CONSTRAINT [DF_CA_USERS_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
/****** Object:  Default [DF_CA_USERS_CreatedDate]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CA_USERS] ADD  CONSTRAINT [DF_CA_USERS_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_CA_USERS_AccessCount]    Script Date: 01/14/2016 19:14:42 ******/
ALTER TABLE [dbo].[CA_USERS] ADD  CONSTRAINT [DF_CA_USERS_AccessCount]  DEFAULT ((0)) FOR [AccessCount]
GO
/****** Object:  Default [DF_CM_REFRESH_Site]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_REFRESH] ADD  CONSTRAINT [DF_CM_REFRESH_Site]  DEFAULT ((0)) FOR [DoAction]
GO
/****** Object:  Default [DF_CM_REFRESH_S]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_REFRESH] ADD  CONSTRAINT [DF_CM_REFRESH_S]  DEFAULT ((-1)) FOR [Specific]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_HardwareTypeID]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_HardwareTypeID]  DEFAULT ((1)) FOR [HardwareTypeID]
GO
/****** Object:  Default [DF_CM_SITE_SiteID]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_SITE_SiteID]  DEFAULT ('') FOR [SiteNumber]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_CellNo]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_CellNo]  DEFAULT ('') FOR [CellNo]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_Name]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSEnabled]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSEnabled]  DEFAULT ((0)) FOR [GPRSEnabled]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSServerSettings]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSServerSettings]  DEFAULT ((1)) FOR [GPRSServerSettings]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSPort]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSPort]  DEFAULT ('') FOR [GPRSPort]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSPWD]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSPWD]  DEFAULT ('') FOR [GPRSPWD]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSOnLoginCheck]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSOnLoginCheck]  DEFAULT ((121)) FOR [GPRSOnLoginCheck]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSConnType]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSConnType]  DEFAULT ((1)) FOR [GPRSConnType]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSAckRequired]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSAckRequired]  DEFAULT ((0)) FOR [GPRSAckRequired]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSSuccClearSMS]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSSuccClearSMS]  DEFAULT ((1)) FOR [GPRSSuccClearSMS]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_PRGPWD]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_PRGPWD]  DEFAULT ('') FOR [PRGPWD]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_CMDPWD]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_CMDPWD]  DEFAULT ('') FOR [CMDPWD]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_SIMIMI]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_SIMIMI]  DEFAULT ('') FOR [SIMIMI]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSPOLEID]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSPOLEID]  DEFAULT ('') FOR [GPRSPOLEID]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_IMEI]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_IMEI]  DEFAULT ('') FOR [IMEI]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_CommSerialNo]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_CommSerialNo]  DEFAULT ('') FOR [CommSerialNo]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_GPRSConnected]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_GPRSConnected]  DEFAULT ((0)) FOR [GPRSConnected]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_LastRXTimestamp]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_LastRXTimestamp]  DEFAULT (getdate()) FOR [LastRXTimestamp]
GO
/****** Object:  Default [DF_CM_COMMUNICATORS_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE] ADD  CONSTRAINT [DF_CM_COMMUNICATORS_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_MISSEDCALLSRECEIVED_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_MISSEDCALLSRECEIVED] ADD  CONSTRAINT [DF_CM_MISSEDCALLSRECEIVED_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_FromSiteID]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_FromSiteID]  DEFAULT ((-1)) FOR [FromSiteID]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_FromContactID]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_FromContactID]  DEFAULT ((-1)) FOR [FromContactID]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_MsgType]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_MsgType]  DEFAULT ('NOT SET') FOR [MsgType]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_MsgProvider]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_MsgProvider]  DEFAULT ('NOT SET') FOR [MsgProvider]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_GatewayID]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_GatewayID]  DEFAULT ((-1)) FOR [GatewayID]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_CellPhone]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_CellPhone]  DEFAULT ('') FOR [CellPhone]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_msgText]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_msgText]  DEFAULT ('') FOR [msgText]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_EventDateTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_EventDateTime]  DEFAULT (getdate()) FOR [EventDateTime]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_SendDateTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_SendDateTime]  DEFAULT ('') FOR [SendDateTime]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_ReceiveDateTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_ReceiveDateTime]  DEFAULT ('') FOR [ReceiveDateTime]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_Handled]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_Handled]  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [DF_CM_MESSAGESRECEIVED_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] ADD  CONSTRAINT [DF_CM_MESSAGESRECEIVED_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_GatewayID]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_GatewayID]  DEFAULT ((-1)) FOR [GatewayID]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_ToSiteID]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_ToSiteID]  DEFAULT ((-1)) FOR [ToSiteID]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_CellPhone]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_CellPhone]  DEFAULT ('') FOR [CellPhone]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_MsgText]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_MsgText]  DEFAULT ('') FOR [MsgText]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_RepRequired]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_RepRequired]  DEFAULT ((1)) FOR [RepRequired]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_Flash]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_Flash]  DEFAULT ((0)) FOR [Flash]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_VP]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_VP]  DEFAULT ('00') FOR [VP]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_Priority]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_Priority]  DEFAULT ((1)) FOR [Priority]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_SendStatus]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_SendStatus]  DEFAULT ('G') FOR [SendStatus]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_MsgRef]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_MsgRef]  DEFAULT ('') FOR [MsgRef]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_SendDateTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_SendDateTime]  DEFAULT ('') FOR [SendDateTime]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_ReceiveDateTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_ReceiveDateTime]  DEFAULT ('') FOR [ReceiveDateTime]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_UseMsgProvide]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_UseMsgProvide]  DEFAULT ('GPRS AND SMS') FOR [UseMsgProvider]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_SendMsgProvider]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_SendMsgProvider]  DEFAULT ('NOT SET') FOR [SendMsgProvider]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_ExpireFlag]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_ExpireFlag]  DEFAULT ((1)) FOR [ExpireFlag]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_ExpireTime]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_ExpireTime]  DEFAULT ((5)) FOR [ExpireTime]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_TheDateTimeStamp]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_TheDateTimeStamp]  DEFAULT (getdate()) FOR [TheDateTimeStamp]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_Status]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_CM_MESSAGESSEND_ExpireDT]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND] ADD  CONSTRAINT [DF_CM_MESSAGESSEND_ExpireDT]  DEFAULT (dateadd(month,(2),getdate())) FOR [ExpireDT]
GO
/****** Object:  ForeignKey [FK_CM_SITE_CM_COMMUNICATORTYPE]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE]  WITH CHECK ADD  CONSTRAINT [FK_CM_SITE_CM_COMMUNICATORTYPE] FOREIGN KEY([HardwareTypeID])
REFERENCES [dbo].[CM_COMMUNICATORTYPE] ([CommunicatorTypeID])
GO
ALTER TABLE [dbo].[CM_SITE] CHECK CONSTRAINT [FK_CM_SITE_CM_COMMUNICATORTYPE]
GO
/****** Object:  ForeignKey [FK_CM_SITE_CM_CONNECTIONTYPE]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE]  WITH CHECK ADD  CONSTRAINT [FK_CM_SITE_CM_CONNECTIONTYPE] FOREIGN KEY([GPRSConnType])
REFERENCES [dbo].[CM_CONNECTIONTYPE] ([ConnTypeID])
GO
ALTER TABLE [dbo].[CM_SITE] CHECK CONSTRAINT [FK_CM_SITE_CM_CONNECTIONTYPE]
GO
/****** Object:  ForeignKey [FK_CM_SITE_CM_GPRSSETTINGS]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_SITE]  WITH CHECK ADD  CONSTRAINT [FK_CM_SITE_CM_GPRSSETTINGS] FOREIGN KEY([GPRSServerSettings])
REFERENCES [dbo].[CM_GPRSSETTINGS] ([SettingsID])
GO
ALTER TABLE [dbo].[CM_SITE] CHECK CONSTRAINT [FK_CM_SITE_CM_GPRSSETTINGS]
GO
/****** Object:  ForeignKey [FK_AllocationArchive_Driver]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[AllocationArchive]  WITH CHECK ADD  CONSTRAINT [FK_AllocationArchive_Driver] FOREIGN KEY([DriverID])
REFERENCES [Lookup].[Driver] ([ID])
GO
ALTER TABLE [dbo].[AllocationArchive] CHECK CONSTRAINT [FK_AllocationArchive_Driver]
GO
/****** Object:  ForeignKey [FK_AllocationArchive_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[AllocationArchive]  WITH CHECK ADD  CONSTRAINT [FK_AllocationArchive_Vehicle] FOREIGN KEY([VehicleDescriptionNrID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[AllocationArchive] CHECK CONSTRAINT [FK_AllocationArchive_Vehicle]
GO
/****** Object:  ForeignKey [FK_Allocation_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[Allocation]  WITH CHECK ADD  CONSTRAINT [FK_Allocation_Vehicle] FOREIGN KEY([VehicleDescriptionNrID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[Allocation] CHECK CONSTRAINT [FK_Allocation_Vehicle]
GO
/****** Object:  ForeignKey [FK_CM_MISSEDCALLSRECEIVED_CM_GATEWAYS]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[CM_MISSEDCALLSRECEIVED]  WITH CHECK ADD  CONSTRAINT [FK_CM_MISSEDCALLSRECEIVED_CM_GATEWAYS] FOREIGN KEY([GatewayID])
REFERENCES [dbo].[CM_GATEWAYS] ([GatewayID])
GO
ALTER TABLE [dbo].[CM_MISSEDCALLSRECEIVED] CHECK CONSTRAINT [FK_CM_MISSEDCALLSRECEIVED_CM_GATEWAYS]
GO
/****** Object:  ForeignKey [FK_BulletScheduleAfternoon_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[BulletScheduleAfternoon]  WITH CHECK ADD  CONSTRAINT [FK_BulletScheduleAfternoon_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[BulletScheduleAfternoon] CHECK CONSTRAINT [FK_BulletScheduleAfternoon_Vehicle]
GO
/****** Object:  ForeignKey [FK_BulletSchedule_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[BulletSchedule]  WITH CHECK ADD  CONSTRAINT [FK_BulletSchedule_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[BulletSchedule] CHECK CONSTRAINT [FK_BulletSchedule_Vehicle]
GO
/****** Object:  ForeignKey [FK_Scan_IN_Doctor]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [NHL].[Scan_IN]  WITH CHECK ADD  CONSTRAINT [FK_Scan_IN_Doctor] FOREIGN KEY([Doctor_ID])
REFERENCES [NHL].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [NHL].[Scan_IN] CHECK CONSTRAINT [FK_Scan_IN_Doctor]
GO
/****** Object:  ForeignKey [FK_Scan_IN_SpecimenType]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [NHL].[Scan_IN]  WITH CHECK ADD  CONSTRAINT [FK_Scan_IN_SpecimenType] FOREIGN KEY([Specimen_Test_ID])
REFERENCES [NHL].[Specimen_Test] ([Specimen_Test_ID])
GO
ALTER TABLE [NHL].[Scan_IN] CHECK CONSTRAINT [FK_Scan_IN_SpecimenType]
GO
/****** Object:  ForeignKey [FK_PretoriaFloridaScheduleBackup_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[PretoriaFloridaScheduleBackup]  WITH CHECK ADD  CONSTRAINT [FK_PretoriaFloridaScheduleBackup_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[PretoriaFloridaScheduleBackup] CHECK CONSTRAINT [FK_PretoriaFloridaScheduleBackup_Vehicle]
GO
/****** Object:  ForeignKey [FK_PretoriaFloridaSchedule_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[PretoriaFloridaSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PretoriaFloridaSchedule_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[PretoriaFloridaSchedule] CHECK CONSTRAINT [FK_PretoriaFloridaSchedule_Vehicle]
GO
/****** Object:  ForeignKey [FK_FloridaPretoriaScheduleBackup_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[FloridaPretoriaScheduleBackup]  WITH CHECK ADD  CONSTRAINT [FK_FloridaPretoriaScheduleBackup_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[FloridaPretoriaScheduleBackup] CHECK CONSTRAINT [FK_FloridaPretoriaScheduleBackup_Vehicle]
GO
/****** Object:  ForeignKey [FK_FloridaPretoriaSchedule_Vehicle]    Script Date: 01/14/2016 19:14:43 ******/
ALTER TABLE [dbo].[FloridaPretoriaSchedule]  WITH CHECK ADD  CONSTRAINT [FK_FloridaPretoriaSchedule_Vehicle] FOREIGN KEY([VehicleID])
REFERENCES [Lookup].[Vehicle] ([ID])
GO
ALTER TABLE [dbo].[FloridaPretoriaSchedule] CHECK CONSTRAINT [FK_FloridaPretoriaSchedule_Vehicle]
GO
/****** Object:  ForeignKey [FK_CM_MESSAGESRECEIVED_CM_CONTACTS]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED]  WITH NOCHECK ADD  CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_CONTACTS] FOREIGN KEY([FromContactID])
REFERENCES [dbo].[CM_CONTACTS] ([ContactID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] NOCHECK CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_CONTACTS]
GO
/****** Object:  ForeignKey [FK_CM_MESSAGESRECEIVED_CM_GATEWAYS]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED]  WITH NOCHECK ADD  CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_GATEWAYS] FOREIGN KEY([GatewayID])
REFERENCES [dbo].[CM_GATEWAYS] ([GatewayID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] NOCHECK CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_GATEWAYS]
GO
/****** Object:  ForeignKey [FK_CM_MESSAGESRECEIVED_CM_SITE]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED]  WITH NOCHECK ADD  CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_SITE] FOREIGN KEY([FromSiteID])
REFERENCES [dbo].[CM_SITE] ([SiteID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CM_MESSAGESRECEIVED] NOCHECK CONSTRAINT [FK_CM_MESSAGESRECEIVED_CM_SITE]
GO
/****** Object:  ForeignKey [FK_CM_MESSAGESSEND_CM_GATEWAYS]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND]  WITH NOCHECK ADD  CONSTRAINT [FK_CM_MESSAGESSEND_CM_GATEWAYS] FOREIGN KEY([GatewayID])
REFERENCES [dbo].[CM_GATEWAYS] ([GatewayID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CM_MESSAGESSEND] NOCHECK CONSTRAINT [FK_CM_MESSAGESSEND_CM_GATEWAYS]
GO
/****** Object:  ForeignKey [FK_CM_MESSAGESSEND_CM_SITE]    Script Date: 01/14/2016 19:14:44 ******/
ALTER TABLE [dbo].[CM_MESSAGESSEND]  WITH NOCHECK ADD  CONSTRAINT [FK_CM_MESSAGESSEND_CM_SITE] FOREIGN KEY([ToSiteID])
REFERENCES [dbo].[CM_SITE] ([SiteID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CM_MESSAGESSEND] NOCHECK CONSTRAINT [FK_CM_MESSAGESSEND_CM_SITE]
GO
