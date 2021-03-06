USE [CellCopMessaging216]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NIB]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NIB](
	[NIBID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_NonInvoiceBased] PRIMARY KEY CLUSTERED 
(
	[NIBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[NIB] ON
INSERT [dbo].[NIB] ([NIBID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (1, N'Yes', 1, CAST(0x0000A5A600000000 AS DateTime))
INSERT [dbo].[NIB] ([NIBID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (2, N'No', 1, CAST(0x0000A5A600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[NIB] OFF
/****** Object:  Table [dbo].[WaterTariff]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterTariff](
	[WaterTariffID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_WaterTariff] PRIMARY KEY CLUSTERED 
(
	[WaterTariffID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WaterTariff] ON
INSERT [dbo].[WaterTariff] ([WaterTariffID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (2, N'1.12', 1, CAST(0x0000A5A800B0736B AS DateTime))
SET IDENTITY_INSERT [dbo].[WaterTariff] OFF
/****** Object:  Table [dbo].[VATBasedInvoice]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VATBasedInvoice](
	[VATBasedInvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_VATBased] PRIMARY KEY CLUSTERED 
(
	[VATBasedInvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VATBasedInvoice] ON
INSERT [dbo].[VATBasedInvoice] ([VATBasedInvoiceID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (1, N'Yes', 1, CAST(0x0000A5A600000000 AS DateTime))
INSERT [dbo].[VATBasedInvoice] ([VATBasedInvoiceID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (2, N'No', 1, CAST(0x0000A5A600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[VATBasedInvoice] OFF
/****** Object:  Table [dbo].[VAT]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT](
	[VATID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [float] NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_VAT] PRIMARY KEY CLUSTERED 
(
	[VATID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VAT] ON
INSERT [dbo].[VAT] ([VATID], [Value], [ModifiedUserID], [ModifiedDate]) VALUES (1, 0.14, 1, CAST(0x0000A5A600000000 AS DateTime))
INSERT [dbo].[VAT] ([VATID], [Value], [ModifiedUserID], [ModifiedDate]) VALUES (2, 1.14, 1, CAST(0x0000A5A600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[VAT] OFF
/****** Object:  Table [Lookup].[Utility]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [Lookup].[Utility](
	[UtilityId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_UtilityId] PRIMARY KEY CLUSTERED 
(
	[UtilityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Lookup].[Utility] ON
INSERT [Lookup].[Utility] ([UtilityId], [Description]) VALUES (1, N'Water')
SET IDENTITY_INSERT [Lookup].[Utility] OFF
/****** Object:  Table [Lookup].[AssetType]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [Lookup].[AssetType](
	[AssetTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AssetTypeId] PRIMARY KEY CLUSTERED 
(
	[AssetTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Lookup].[AssetType] ON
INSERT [Lookup].[AssetType] ([AssetTypeId], [Description], [ModifiedUserId], [ModifiedDate], [IsActive]) VALUES (1, N'Residential Accomodation', 1, CAST(0x0000A5A000000000 AS DateTime), 1)
INSERT [Lookup].[AssetType] ([AssetTypeId], [Description], [ModifiedUserId], [ModifiedDate], [IsActive]) VALUES (3, N'Office Accomodation', 1, CAST(0x0000A5A000000000 AS DateTime), 1)
SET IDENTITY_INSERT [Lookup].[AssetType] OFF
/****** Object:  Table [dbo].[Supplier]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](500) NULL,
	[SupplierAddress] [nvarchar](500) NULL,
	[Telephone] [varchar](13) NULL,
	[Cellphone] [varchar](13) NULL,
	[Fax] [varchar](13) NULL,
	[ModifiedDate] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[ContactPerson] [varchar](100) NULL,
	[VATNumber] [varchar](50) NULL,
	[ModifiedUserID] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lookup].[ReferenceType]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [Lookup].[ReferenceType](
	[ReferenceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ReferenceTypeId] PRIMARY KEY CLUSTERED 
(
	[ReferenceTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Lookup].[ReferenceType] ON
INSERT [Lookup].[ReferenceType] ([ReferenceTypeId], [Description], [ModifiedUserId], [ModifiedDate], [IsActive]) VALUES (1, N'Ref Test 1', 1, CAST(0x0000A5A000000000 AS DateTime), 1)
SET IDENTITY_INSERT [Lookup].[ReferenceType] OFF
/****** Object:  Table [Lookup].[PropertyOwnership]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [Lookup].[PropertyOwnership](
	[PropertyOwnershipId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PropertyOwnershipId] PRIMARY KEY CLUSTERED 
(
	[PropertyOwnershipId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Lookup].[PropertyOwnership] ON
INSERT [Lookup].[PropertyOwnership] ([PropertyOwnershipId], [Description], [ModifiedUserId], [ModifiedDate], [IsActive]) VALUES (1, N'Leased', 1, CAST(0x0000A5A600000000 AS DateTime), 1)
INSERT [Lookup].[PropertyOwnership] ([PropertyOwnershipId], [Description], [ModifiedUserId], [ModifiedDate], [IsActive]) VALUES (2, N'Owned', 1, CAST(0x0000A5A600000000 AS DateTime), 1)
SET IDENTITY_INSERT [Lookup].[PropertyOwnership] OFF
/****** Object:  Table [dbo].[IncomeCategory]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeCategory](
	[IncomeCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_IncomeCategory] PRIMARY KEY CLUSTERED 
(
	[IncomeCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenditureType]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenditureType](
	[ExpenditureTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Expenditure] PRIMARY KEY CLUSTERED 
(
	[ExpenditureTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnergyUsageLimit]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnergyUsageLimit](
	[EnergyUsageLimitID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EnergyUsageLimit] PRIMARY KEY CLUSTERED 
(
	[EnergyUsageLimitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnergyTariff]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnergyTariff](
	[EnergyTariffID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ModifiedUserID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_EnergyTariff] PRIMARY KEY CLUSTERED 
(
	[EnergyTariffID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EnergyTariff] ON
INSERT [dbo].[EnergyTariff] ([EnergyTariffID], [Name], [ModifiedUserID], [ModifiedDate]) VALUES (3, N'1.33', 1, CAST(0x0000A5B000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[EnergyTariff] OFF
/****** Object:  View [dbo].[tbs_WATERFLOW_view]    Script Date: 02/21/2016 13:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbs_WATERFLOW_view]
AS
SELECT     TOP (100) PERCENT dbo.CM_SITE.Name, dbo.CM_SITE.SiteNumber, dbo.CM_MESSAGESRECEIVED.EventDateTime, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input1, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input2, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input3, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input4, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input5, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input6, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input7, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Input8, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Battery, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog1, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog2, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog3, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog4, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog5, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog6, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog7, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog8, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog1AvG, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog2AvG, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog3AvG, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Analog4AvG, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Counter1, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Counter2, 
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Counter3, dbo.CM_MESSAGESRECEIVEDUNDELIMITED.Counter4
FROM         dbo.CM_MESSAGESRECEIVED INNER JOIN
                      dbo.CM_MESSAGESRECEIVEDUNDELIMITED ON dbo.CM_MESSAGESRECEIVED.ReceiveID = dbo.CM_MESSAGESRECEIVEDUNDELIMITED.ReceiveID INNER JOIN
                      dbo.CM_SITE ON dbo.CM_MESSAGESRECEIVED.FromSiteID = dbo.CM_SITE.SiteID
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
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 274
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_MESSAGESRECEIVEDUNDELIMITED"
            Begin Extent = 
               Top = 30
               Left = 720
               Bottom = 284
               Right = 1051
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 135
               Left = 358
               Bottom = 343
               Right = 602
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbs_WATERFLOW_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbs_WATERFLOW_view'
GO
/****** Object:  View [dbo].[tbs_POWERREADINGS_view]    Script Date: 02/21/2016 13:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbs_POWERREADINGS_view]
AS
SELECT     dbo.CM_SITE.Name, dbo.CM_SITE.SiteNumber, dbo.CM_MESSAGESRECEIVED.EventDateTime, dbo.CM_PowerMESSAGESUNDELIMITED.MeterNumber, 
                      dbo.CM_PowerMESSAGESUNDELIMITED.MeterReading, dbo.CM_PowerMESSAGESUNDELIMITED.BatteryVoltage, 
                      dbo.CM_PowerMESSAGESUNDELIMITED.PowerStatus, dbo.CM_PowerMESSAGESUNDELIMITED.PSiteName, dbo.CM_PowerMESSAGESUNDELIMITED.ReadingDate, 
                      dbo.CM_PowerMESSAGESUNDELIMITED.ReadingTime
FROM         dbo.CM_MESSAGESRECEIVED INNER JOIN
                      dbo.CM_SITE ON dbo.CM_MESSAGESRECEIVED.FromSiteID = dbo.CM_SITE.SiteID INNER JOIN
                      dbo.CM_PowerMESSAGESUNDELIMITED ON dbo.CM_MESSAGESRECEIVED.ReceiveID = dbo.CM_PowerMESSAGESUNDELIMITED.ReceiveID
WHERE     (dbo.CM_PowerMESSAGESUNDELIMITED.MeterNumber <> 'No Reading')
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
         Begin Table = "CM_MESSAGESRECEIVED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 303
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_SITE"
            Begin Extent = 
               Top = 107
               Left = 257
               Bottom = 315
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CM_PowerMESSAGESUNDELIMITED"
            Begin Extent = 
               Top = 24
               Left = 516
               Bottom = 259
               Right = 695
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbs_POWERREADINGS_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbs_POWERREADINGS_view'
GO
/****** Object:  StoredProcedure [dbo].[PowerMESSAGESRECEIVEDUNDELIMITED]    Script Date: 02/21/2016 13:52:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PowerMESSAGESRECEIVEDUNDELIMITED]
AS
BEGIN
	DECLARE @TABLERECEIVEDID NUMERIC(18, 0)

	DECLARE @TABLEPowerMeterSlot NVARCHAR(50)
	--DECLARE @TABLECHANNEL NVARCHAR(50)
	DECLARE @TABLEMeterNumber NVARCHAR(50)
	DECLARE @TABLEMeterReading NVARCHAR(50)

	DECLARE @TABLEBatteryVoltage NVARCHAR(50)
	DECLARE @TABLEPowerStatus NVARCHAR(50)
	DECLARE @TABLEUStatus NVARCHAR(50)
	DECLARE @TABLEPSiteName NVARCHAR(50)	
	DECLARE @TABLEReadingDate NVARCHAR(50)
	DECLARE @TABLEReadingTime NVARCHAR(50)
	

	DECLARE @RECEIVED INT
	DECLARE CM_DATACURSOR CURSOR FOR 
	SELECT CM_MESSAGESRECEIVED.RECEIVEID
	FROM CM_MESSAGESRECEIVED	
	
	WHERE MSGTEXT LIKE '%PowerMeter%'
	AND CM_MESSAGESRECEIVED.RECEIVEID
	NOT IN (SELECT CM_PowerMESSAGESUNDELIMITED.RECEIVEID FROM CM_PowerMESSAGESUNDELIMITED)
	ORDER BY CM_MESSAGESRECEIVED.RECEIVEID DESC;

	OPEN CM_DATACURSOR

	FETCH NEXT FROM CM_DATACURSOR 
	INTO @RECEIVED

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @Str NVARCHAR(MAX)
		SET @Str = (Select  
				'|' + Convert(Varchar(1000), [ReceiveID])  
				+  '|' + RTRIM(REPLACE(REPLACE(REPLACE(SUBSTRING(dbo.CM_MESSAGESRECEIVED.msgText, 1, 200), ',', '|'), ';', ' '), ':--', '|')) + '|' 
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
				SET @TABLEPowerMeterSlot = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 3)
				SET @TABLEMeterNumber = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 4)
				SET @TABLEMeterReading = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 5)
				SET @TABLEBatteryVoltage   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))			
			IF (@INTLOCATION = 6)
				SET @TABLEPowerStatus  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))  
			IF (@INTLOCATION = 7)
				SET @TABLEUStatus  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 8)
				SET @TABLEPSiteName  = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 9)
				SET @TABLEReadingDate = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			IF (@INTLOCATION = 10)
				SET @TABLEReadingTime   = (SUBSTRING(@Str, (@IND  + 1),  @EIND))
			
				
			--SELECT (SUBSTRING(@Str, (@IND  + 1),  @EIND)) 'FieldData'
			SELECT @IND = ISNULL(CHARINDEX('|', @STR, @IND + 1), 0) 
		END
    
		--INSERT INTO NEWLY CREATED TABLE HERE
		INSERT INTO [CellcopMessaging210].[dbo].[CM_PowerMESSAGESUNDELIMITED] 
			 ([RECEIVEID]
			 ,[PowerMeterSlot]
			 ,[MeterNumber]
			 ,[MeterReading]
		     ,[BatteryVoltage]
		     ,[PowerStatus]
			 ,[UStatus]
		     ,[PSiteName]
		     ,[ReadingDate]
			 ,[ReadingTime])
		VALUES
			(@TABLERECEIVEDID
			,@TABLEPowerMeterSlot
			,Replace(@TABLEMeterNumber,'-',' ')
			,@TABLEMeterReading
			,@TABLEBatteryVoltage
			,@TABLEPowerStatus
			,@TABLEUStatus
			,@TABLEPSiteName
			,@TABLEReadingDate	
			,@TABLEReadingTime)

		FETCH NEXT FROM CM_DATACURSOR 
		INTO @RECEIVED   
	END 
	CLOSE CM_DATACURSOR;
	DEALLOCATE CM_DATACURSOR;

END
GO
/****** Object:  Table [dbo].[IncomeInvoice]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[IncomeInvoice](
	[IncomeID] [int] IDENTITY(1,1) NOT NULL,
	[VATBasedInvoiceID] [int] NULL,
	[PropertySiteID] [int] NULL,
	[Amount_Exc_VAT] [float] NULL,
	[VAT] [float] NULL,
	[VAT_Value] [float] NULL,
	[Total_Amount] [float] NULL,
	[Inv_Number] [nvarchar](50) NULL,
	[Inv_Date] [datetime] NULL,
	[Inv_Attachment] [varbinary](max) NULL,
	[ModifiedDate] [datetime] NULL,
	[PaymentReceiptAttachment] [varbinary](max) NULL,
	[DoesItIncVATID] [int] NULL,
	[ModifiedUserID] [int] NULL,
 CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED 
(
	[IncomeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeInvoice] ON
INSERT [dbo].[IncomeInvoice] ([IncomeID], [VATBasedInvoiceID], [PropertySiteID], [Amount_Exc_VAT], [VAT], [VAT_Value], [Total_Amount], [Inv_Number], [Inv_Date], [Inv_Attachment], [ModifiedDate], [PaymentReceiptAttachment], [DoesItIncVATID], [ModifiedUserID]) VALUES (1, 2, 15, NULL, NULL, NULL, 5000, N'inv101', CAST(0x0000A5A700000000 AS DateTime), 0x5B53797374656D2E5765622E53657276696365732E5765624D6574686F645D0D0A5B53797374656D2E5765622E5363726970742E53657276696365732E5363726970744D6574686F645D0D0A0D0A0D0A7075626C696320416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20476574536C6964657328290D0A7B0D0A416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20736C69646573203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B335D3B0D0A736C696465735B305D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822312E6A7067222C2022496D61676531222C2022686F75736522293B0D0A736C696465735B315D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822322E6A7067222C2022496D61676532222C20227365617369646522293B0D0A736C696465735B325D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822332E6A7067222C2022496D61676533222C202263617222293B0D0A72657475726E2028736C69646573293B0D0A7D0D0A0D0A, CAST(0x0000A5A600CFFA13 AS DateTime), NULL, 0, 1)
INSERT [dbo].[IncomeInvoice] ([IncomeID], [VATBasedInvoiceID], [PropertySiteID], [Amount_Exc_VAT], [VAT], [VAT_Value], [Total_Amount], [Inv_Number], [Inv_Date], [Inv_Attachment], [ModifiedDate], [PaymentReceiptAttachment], [DoesItIncVATID], [ModifiedUserID]) VALUES (2, 1, 15, 131578.95, 0.14, 18421.05, 150000, N'inv102', CAST(0x0000A5A300000000 AS DateTime), 0x, CAST(0x0000A5A600D1F812 AS DateTime), NULL, 1, 1)
INSERT [dbo].[IncomeInvoice] ([IncomeID], [VATBasedInvoiceID], [PropertySiteID], [Amount_Exc_VAT], [VAT], [VAT_Value], [Total_Amount], [Inv_Number], [Inv_Date], [Inv_Attachment], [ModifiedDate], [PaymentReceiptAttachment], [DoesItIncVATID], [ModifiedUserID]) VALUES (3, 2, 14, NULL, NULL, NULL, 5000, N'inv002', CAST(0x0000A5A200000000 AS DateTime), 0x5B53797374656D2E5765622E53657276696365732E5765624D6574686F645D0D0A5B53797374656D2E5765622E5363726970742E53657276696365732E5363726970744D6574686F645D0D0A0D0A0D0A7075626C696320416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20476574536C6964657328290D0A7B0D0A416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20736C69646573203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B335D3B0D0A736C696465735B305D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822312E6A7067222C2022496D61676531222C2022686F75736522293B0D0A736C696465735B315D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822322E6A7067222C2022496D61676532222C20227365617369646522293B0D0A736C696465735B325D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822332E6A7067222C2022496D61676533222C202263617222293B0D0A72657475726E2028736C69646573293B0D0A7D0D0A0D0A, CAST(0x0000A5A600EE9B50 AS DateTime), NULL, 0, 1)
INSERT [dbo].[IncomeInvoice] ([IncomeID], [VATBasedInvoiceID], [PropertySiteID], [Amount_Exc_VAT], [VAT], [VAT_Value], [Total_Amount], [Inv_Number], [Inv_Date], [Inv_Attachment], [ModifiedDate], [PaymentReceiptAttachment], [DoesItIncVATID], [ModifiedUserID]) VALUES (4, 2, 15, NULL, NULL, NULL, 7500, N'inv001', CAST(0x0000A5A200000000 AS DateTime), 0x5B53797374656D2E5765622E53657276696365732E5765624D6574686F645D0D0A5B53797374656D2E5765622E5363726970742E53657276696365732E5363726970744D6574686F645D0D0A0D0A0D0A7075626C696320416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20476574536C6964657328290D0A7B0D0A416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20736C69646573203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B335D3B0D0A736C696465735B305D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822312E6A7067222C2022496D61676531222C2022686F75736522293B0D0A736C696465735B315D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822322E6A7067222C2022496D61676532222C20227365617369646522293B0D0A736C696465735B325D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822332E6A7067222C2022496D61676533222C202263617222293B0D0A72657475726E2028736C69646573293B0D0A7D0D0A0D0A, CAST(0x0000A5A600EF561E AS DateTime), NULL, 0, 1)
INSERT [dbo].[IncomeInvoice] ([IncomeID], [VATBasedInvoiceID], [PropertySiteID], [Amount_Exc_VAT], [VAT], [VAT_Value], [Total_Amount], [Inv_Number], [Inv_Date], [Inv_Attachment], [ModifiedDate], [PaymentReceiptAttachment], [DoesItIncVATID], [ModifiedUserID]) VALUES (5, 2, 14, NULL, NULL, NULL, 8748, N'd45', CAST(0x0000A5A700000000 AS DateTime), 0x5B53797374656D2E5765622E53657276696365732E5765624D6574686F645D0D0A5B53797374656D2E5765622E5363726970742E53657276696365732E5363726970744D6574686F645D0D0A0D0A0D0A7075626C696320416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20476574536C6964657328290D0A7B0D0A416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B5D20736C69646573203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964655B335D3B0D0A736C696465735B305D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822312E6A7067222C2022496D61676531222C2022686F75736522293B0D0A736C696465735B315D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822322E6A7067222C2022496D61676532222C20227365617369646522293B0D0A736C696465735B325D203D206E657720416A6178436F6E74726F6C546F6F6C6B69742E536C6964652822332E6A7067222C2022496D61676533222C202263617222293B0D0A72657475726E2028736C69646573293B0D0A7D0D0A0D0A, CAST(0x0000A5A600FB410A AS DateTime), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[IncomeInvoice] OFF
/****** Object:  Table [dbo].[PropertyIdentification]    Script Date: 02/21/2016 13:52:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PropertyIdentification](
	[PropertyIdentificationID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[PropertyOwnershipId] [int] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssetNumber] [uniqueidentifier] NOT NULL,
	[AssetName] [varchar](200) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[RegistrationNumber] [varchar](50) NOT NULL,
	[ErfNumber] [varchar](50) NOT NULL,
	[AssetTypeID] [int] NOT NULL,
 CONSTRAINT [PK_PropertyIdentification] PRIMARY KEY CLUSTERED 
(
	[PropertyIdentificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyIdentification] ON
INSERT [dbo].[PropertyIdentification] ([PropertyIdentificationID], [SiteID], [PropertyOwnershipId], [ModifiedUserId], [ModifiedDate], [IsActive], [AssetNumber], [AssetName], [Description], [RegistrationNumber], [ErfNumber], [AssetTypeID]) VALUES (1, 14, 1, 1, CAST(0x0000A5A600A7C124 AS DateTime), 1, N'00000000-0000-0000-0000-000000000000', N'Mabunda Building', N'14 floor building on 12 nana sita', N'4525/858', N'7856', 1)
INSERT [dbo].[PropertyIdentification] ([PropertyIdentificationID], [SiteID], [PropertyOwnershipId], [ModifiedUserId], [ModifiedDate], [IsActive], [AssetNumber], [AssetName], [Description], [RegistrationNumber], [ErfNumber], [AssetTypeID]) VALUES (4, 14, 2, 1, CAST(0x0000A5A6010AD4C3 AS DateTime), 1, N'00000000-0000-0000-0000-000000000000', N'Vittori Building', N'12th floor building', N'4525/858', N'5458', 3)
SET IDENTITY_INSERT [dbo].[PropertyIdentification] OFF
/****** Object:  ForeignKey [FK_Income_Site]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[IncomeInvoice]  WITH CHECK ADD  CONSTRAINT [FK_Income_Site] FOREIGN KEY([PropertySiteID])
REFERENCES [dbo].[CM_SITE] ([SiteID])
GO
ALTER TABLE [dbo].[IncomeInvoice] CHECK CONSTRAINT [FK_Income_Site]
GO
/****** Object:  ForeignKey [FK_Income_VATBased]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[IncomeInvoice]  WITH CHECK ADD  CONSTRAINT [FK_Income_VATBased] FOREIGN KEY([VATBasedInvoiceID])
REFERENCES [dbo].[VATBasedInvoice] ([VATBasedInvoiceID])
GO
ALTER TABLE [dbo].[IncomeInvoice] CHECK CONSTRAINT [FK_Income_VATBased]
GO
/****** Object:  ForeignKey [FK_PropertyIdentification_AssetTypeId]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[PropertyIdentification]  WITH CHECK ADD  CONSTRAINT [FK_PropertyIdentification_AssetTypeId] FOREIGN KEY([AssetTypeID])
REFERENCES [Lookup].[AssetType] ([AssetTypeId])
GO
ALTER TABLE [dbo].[PropertyIdentification] CHECK CONSTRAINT [FK_PropertyIdentification_AssetTypeId]
GO
/****** Object:  ForeignKey [FK_PropertyIdentification_CM_SiteID]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[PropertyIdentification]  WITH CHECK ADD  CONSTRAINT [FK_PropertyIdentification_CM_SiteID] FOREIGN KEY([SiteID])
REFERENCES [dbo].[CM_SITE] ([SiteID])
GO
ALTER TABLE [dbo].[PropertyIdentification] CHECK CONSTRAINT [FK_PropertyIdentification_CM_SiteID]
GO
/****** Object:  ForeignKey [FK_PropertyIdentification_PropertyOwnership]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[PropertyIdentification]  WITH CHECK ADD  CONSTRAINT [FK_PropertyIdentification_PropertyOwnership] FOREIGN KEY([PropertyOwnershipId])
REFERENCES [Lookup].[PropertyOwnership] ([PropertyOwnershipId])
GO
ALTER TABLE [dbo].[PropertyIdentification] CHECK CONSTRAINT [FK_PropertyIdentification_PropertyOwnership]
GO
/****** Object:  ForeignKey [FK_PropertyIdentification_UserModifiedUserId]    Script Date: 02/21/2016 13:52:53 ******/
ALTER TABLE [dbo].[PropertyIdentification]  WITH CHECK ADD  CONSTRAINT [FK_PropertyIdentification_UserModifiedUserId] FOREIGN KEY([ModifiedUserId])
REFERENCES [Security].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PropertyIdentification] CHECK CONSTRAINT [FK_PropertyIdentification_UserModifiedUserId]
GO
