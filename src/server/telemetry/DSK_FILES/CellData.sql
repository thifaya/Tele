USE [CellcopMessaging210]
GO
/****** Object:  Table [dbo].[CM_REFRESH]    Script Date: 01/16/2016 15:08:25 ******/
/****** Object:  Table [dbo].[CM_GPRSSETTINGS]    Script Date: 01/16/2016 15:08:25 ******/
SET IDENTITY_INSERT [dbo].[CM_GPRSSETTINGS] ON
INSERT [dbo].[CM_GPRSSETTINGS] ([SettingsID], [Name], [ConMode], [ConType], [IP], [DNSName], [DNS1], [DNS2], [APN], [APNLogin], [APNPWD], [TheDateTimeStamp]) VALUES (1, N'GSM', N'GPRS', N'GPRS', N'10.10.10.10', N'wertwe', N'10.5.6.9', N'10.5.6.9', N'internet', N'', N'', CAST(0x0000A43400CE7DFA AS DateTime))
SET IDENTITY_INSERT [dbo].[CM_GPRSSETTINGS] OFF
/****** Object:  Table [dbo].[CM_GPRSLOG]    Script Date: 01/16/2016 15:08:25 ******/
/****** Object:  Table [dbo].[CM_GATEWAYS]    Script Date: 01/16/2016 15:08:25 ******/
/****** Object:  Table [dbo].[CM_CONTACTS]    Script Date: 01/16/2016 15:08:25 ******/
/****** Object:  Table [dbo].[CM_CONNECTIONTYPE]    Script Date: 01/16/2016 15:08:25 ******/
SET IDENTITY_INSERT [dbo].[CM_CONNECTIONTYPE] ON
INSERT [dbo].[CM_CONNECTIONTYPE] ([ConnTypeID], [Name]) VALUES (1, N'MTN')
INSERT [dbo].[CM_CONNECTIONTYPE] ([ConnTypeID], [Name]) VALUES (2, N'Vodacom')
SET IDENTITY_INSERT [dbo].[CM_CONNECTIONTYPE] OFF
/****** Object:  Table [dbo].[CM_COMMUNICATORTYPE]    Script Date: 01/16/2016 15:08:25 ******/
SET IDENTITY_INSERT [dbo].[CM_COMMUNICATORTYPE] ON
INSERT [dbo].[CM_COMMUNICATORTYPE] ([CommunicatorTypeID], [Description], [Version]) VALUES (1, N'CP52M-GPS', N'20150101')
SET IDENTITY_INSERT [dbo].[CM_COMMUNICATORTYPE] OFF
