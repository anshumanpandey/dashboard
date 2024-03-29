USE [corsrbhprod_dd]
GO
/****** Object:  Table [dbo].[ModuleTimeSpan]    Script Date: 23/06/2020 14:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleTimeSpan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [varchar](1000) NULL,
	[ModuleName] [varchar](50) NULL,
	[UserName] [varchar](104) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Year] [int] NULL,
	[Month] [char](3) NULL,
	[Quarter] [char](2) NULL,
	[Week] [datetime] NULL,
 CONSTRAINT [PK_ModuleTimeSpan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginAuditTrail]    Script Date: 23/06/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginAuditTrail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[UserID] [varchar](104) NULL,
	[LoginDateTime] [datetime] NULL,
	[LogoutDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserLoginAuditTrail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23/06/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[Role] [varchar](20) NULL,
	[Code] [varchar](20) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[UserID] [nvarchar](104) NULL,
	[Speciality] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[IsApproved] [bit] NULL,
	[LastLoginDateTime] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ModuleTimeSpan] ON 

INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1002, N'2321325454', N'QAP', N'AnshumanPandey', CAST(N'2020-06-21T09:08:11.303' AS DateTime), CAST(N'2020-06-23T04:30:30.230' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T09:08:11.303' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1005, N'2321325454', N'ME', N'AnshumanPandey', CAST(N'2020-06-21T09:45:49.347' AS DateTime), CAST(N'2020-06-21T09:48:40.860' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T09:45:49.347' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1007, N'2321325454', N'SJR1', N'AnshumanPandey', CAST(N'2020-06-21T09:57:20.073' AS DateTime), CAST(N'2020-06-21T09:58:11.730' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T09:57:20.073' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1016, N'2321325454', N'SJR2', N'AnshumanPandey', CAST(N'2020-06-21T17:49:06.100' AS DateTime), CAST(N'2020-06-21T17:51:20.873' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T17:49:06.100' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1017, N'2321325454', N'SJR Outcome', N'AnshumanPandey', CAST(N'2020-06-21T18:49:20.467' AS DateTime), CAST(N'2020-06-21T19:12:40.100' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T18:49:20.467' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (1022, N'2321325454', N'Coding Review', N'AnshumanPandey', CAST(N'2020-06-21T19:13:16.417' AS DateTime), CAST(N'2020-06-21T19:13:25.250' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T19:13:16.417' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2014, N'7778888', N'QAP', N'guest_user01', CAST(N'2020-06-23T04:30:43.163' AS DateTime), CAST(N'2020-06-23T04:30:50.637' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2015, N'7778888', N'ME', N'guest_user01', CAST(N'2020-06-23T04:31:20.333' AS DateTime), CAST(N'2020-06-23T04:31:48.817' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2016, N'7778888', N'SJR1', N'guest_user01', CAST(N'2020-06-23T04:31:56.243' AS DateTime), CAST(N'2020-06-23T04:32:35.397' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2017, N'7778888', N'SJR Outcome', N'guest_user01', CAST(N'2020-06-23T04:32:37.640' AS DateTime), CAST(N'2020-06-23T04:32:48.003' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2018, N'7778888', N'SJR2', N'guest_user01', CAST(N'2020-06-23T04:32:50.283' AS DateTime), CAST(N'2020-06-23T04:33:50.910' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2019, N'7778888', N'Coding Review', N'guest_user01', CAST(N'2020-06-23T04:33:56.190' AS DateTime), CAST(N'2020-06-23T04:34:03.540' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2020, N'42423', N'QAP', N'guest_user01', CAST(N'2020-06-23T04:34:37.917' AS DateTime), CAST(N'2020-06-23T04:34:45.143' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2021, N'42423', N'ME', N'guest_user01', CAST(N'2020-06-23T04:34:50.480' AS DateTime), CAST(N'2020-06-23T04:35:04.380' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2022, N'42423', N'SJR1', N'guest_user01', CAST(N'2020-06-23T04:35:06.300' AS DateTime), CAST(N'2020-06-23T04:35:37.187' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2023, N'42423', N'SJR Outcome', N'guest_user01', CAST(N'2020-06-23T04:35:39.253' AS DateTime), CAST(N'2020-06-23T04:35:46.237' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2024, N'42423', N'Coding Review', N'guest_user01', CAST(N'2020-06-23T04:35:48.960' AS DateTime), CAST(N'2020-06-23T04:35:53.230' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ModuleTimeSpan] ([ID], [PatientID], [ModuleName], [UserName], [StartTime], [EndTime], [Year], [Month], [Quarter], [Week]) VALUES (2027, N'2321325454', N'MEO', N'AnshumanPandey', CAST(N'2020-06-23T06:18:33.380' AS DateTime), CAST(N'2020-06-23T06:18:37.683' AS DateTime), 2020, N'Jun', N'Q2', CAST(N'2020-06-27T06:18:33.380' AS DateTime))
SET IDENTITY_INSERT [dbo].[ModuleTimeSpan] OFF
SET IDENTITY_INSERT [dbo].[UserLoginAuditTrail] ON 

INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (1, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:27:16.203' AS DateTime), CAST(N'2020-04-08T11:28:01.183' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (2, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:30:04.113' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (3, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:33:07.660' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:34:06.310' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:47:29.243' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6, 1, N'AnshumanPandey', CAST(N'2020-04-08T11:50:21.540' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7, 1, N'AnshumanPandey', CAST(N'2020-04-08T14:31:01.933' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8, 1, N'AnshumanPandey', CAST(N'2020-04-08T14:36:22.127' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (1002, 1, N'AnshumanPandey', CAST(N'2020-04-08T15:36:52.563' AS DateTime), CAST(N'2020-04-08T15:40:35.020' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (1003, 1, N'AnshumanPandey', CAST(N'2020-04-08T15:48:15.983' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (1004, 1, N'AnshumanPandey', CAST(N'2020-04-08T17:06:05.227' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (1005, 1, N'AnshumanPandey', CAST(N'2020-04-08T18:27:31.880' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (2005, 1, N'AnshumanPandey', CAST(N'2020-04-09T09:22:44.733' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (3005, 1, N'AnshumanPandey', CAST(N'2020-04-11T08:35:03.433' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (3006, 1, N'AnshumanPandey', CAST(N'2020-04-12T17:39:23.720' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (3007, 1, N'AnshumanPandey', CAST(N'2020-04-13T15:54:10.437' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4006, 1, N'AnshumanPandey', CAST(N'2020-04-13T16:46:13.063' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4007, 1, N'AnshumanPandey', CAST(N'2020-04-13T17:19:44.610' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4008, 1, N'AnshumanPandey', CAST(N'2020-04-13T17:56:59.370' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4009, 1, N'AnshumanPandey', CAST(N'2020-04-13T18:33:55.970' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4010, 1, N'AnshumanPandey', CAST(N'2020-04-13T18:37:46.413' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4011, 1, N'AnshumanPandey', CAST(N'2020-04-13T18:45:28.637' AS DateTime), CAST(N'2020-04-13T19:21:36.690' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4012, 1, N'AnshumanPandey', CAST(N'2020-04-13T19:21:39.657' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4013, 1, N'AnshumanPandey', CAST(N'2020-04-13T19:23:03.060' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4014, 1, N'AnshumanPandey', CAST(N'2020-04-13T19:41:31.753' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4015, 1, N'AnshumanPandey', CAST(N'2020-04-13T19:44:55.073' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4016, 1, N'AnshumanPandey', CAST(N'2020-04-13T20:08:43.657' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4017, 1, N'AnshumanPandey', CAST(N'2020-04-13T20:44:12.583' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (4018, 1, N'AnshumanPandey', CAST(N'2020-04-14T07:24:28.043' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5006, 1, N'AnshumanPandey', CAST(N'2020-04-14T10:19:03.177' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5007, 1, N'AnshumanPandey', CAST(N'2020-04-14T10:39:10.150' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5008, 1, N'AnshumanPandey', CAST(N'2020-04-14T10:43:41.247' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5009, 1, N'AnshumanPandey', CAST(N'2020-04-14T10:45:21.363' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5010, 1, N'AnshumanPandey', CAST(N'2020-04-14T11:12:13.163' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5011, 1, N'AnshumanPandey', CAST(N'2020-04-14T11:20:45.867' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5012, 1, N'AnshumanPandey', CAST(N'2020-04-14T17:53:26.723' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5013, 1, N'AnshumanPandey', CAST(N'2020-04-14T18:38:25.603' AS DateTime), CAST(N'2020-04-14T18:44:53.160' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5014, 1, N'AnshumanPandey', CAST(N'2020-04-14T18:44:57.303' AS DateTime), CAST(N'2020-04-14T20:20:48.207' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5015, 1, N'AnshumanPandey', CAST(N'2020-04-14T19:51:10.727' AS DateTime), CAST(N'2020-04-14T20:20:48.207' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5016, 1, N'AnshumanPandey', CAST(N'2020-04-14T20:00:31.930' AS DateTime), CAST(N'2020-04-14T20:20:48.207' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5017, 1, N'AnshumanPandey', CAST(N'2020-04-14T20:20:51.203' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5018, 1, N'AnshumanPandey', CAST(N'2020-04-14T20:34:12.537' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5019, 1, N'AnshumanPandey', CAST(N'2020-04-14T20:39:34.440' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5020, 1, N'AnshumanPandey', CAST(N'2020-04-14T21:22:52.060' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5021, 1, N'AnshumanPandey', CAST(N'2020-04-14T21:33:55.360' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5022, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:21:23.873' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5023, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:24:34.013' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5024, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:28:01.733' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5025, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:36:07.527' AS DateTime), CAST(N'2020-04-14T22:37:30.533' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5026, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:37:33.600' AS DateTime), CAST(N'2020-04-14T22:58:30.203' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5027, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:49:09.460' AS DateTime), CAST(N'2020-04-14T22:58:30.203' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5028, 1, N'AnshumanPandey', CAST(N'2020-04-14T22:53:43.493' AS DateTime), CAST(N'2020-04-14T22:58:30.203' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5029, 1, N'AnshumanPandey', CAST(N'2020-04-15T16:46:16.177' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5030, 1, N'AnshumanPandey', CAST(N'2020-04-15T16:59:17.677' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5031, 1, N'AnshumanPandey', CAST(N'2020-04-15T17:02:25.547' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5032, 1, N'AnshumanPandey', CAST(N'2020-04-15T17:20:15.920' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5033, 1, N'AnshumanPandey', CAST(N'2020-04-15T17:24:59.350' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5034, 1, N'AnshumanPandey', CAST(N'2020-04-15T17:32:20.030' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5035, 1, N'AnshumanPandey', CAST(N'2020-04-15T17:39:27.640' AS DateTime), CAST(N'2020-04-15T17:47:19.167' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5036, 1, N'AnshumanPandey', CAST(N'2020-04-15T19:02:47.780' AS DateTime), CAST(N'2020-04-15T20:40:38.573' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5037, 1, N'AnshumanPandey', CAST(N'2020-04-15T19:06:39.670' AS DateTime), CAST(N'2020-04-15T20:40:38.573' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (5038, 1, N'AnshumanPandey', CAST(N'2020-04-15T19:40:33.657' AS DateTime), CAST(N'2020-04-15T20:40:38.573' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6029, 1, N'AnshumanPandey', CAST(N'2020-04-15T20:38:34.757' AS DateTime), CAST(N'2020-04-15T20:40:38.573' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6030, 1, N'AnshumanPandey', CAST(N'2018-02-17T16:41:29.220' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6031, 1, N'AnshumanPandey', CAST(N'2020-04-17T17:22:49.987' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6032, 1, N'AnshumanPandey', CAST(N'2020-04-17T17:55:52.977' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6033, 1, N'AnshumanPandey', CAST(N'2020-04-17T18:00:13.683' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6034, 1, N'AnshumanPandey', CAST(N'2020-04-17T18:03:23.193' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6035, 1, N'AnshumanPandey', CAST(N'2020-04-17T18:05:49.490' AS DateTime), CAST(N'2020-04-17T18:07:18.340' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6036, 1, N'AnshumanPandey', CAST(N'2020-04-18T08:01:19.783' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6037, 1, N'AnshumanPandey', CAST(N'2020-04-18T08:50:47.920' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6038, 1, N'AnshumanPandey', CAST(N'2020-04-18T09:01:49.347' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6039, 1, N'AnshumanPandey', CAST(N'2020-04-18T10:11:43.337' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6040, 1, N'ShawN', CAST(N'2020-04-18T10:13:01.363' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6041, 1, N'AnshumanPandey', CAST(N'2020-04-18T10:41:19.180' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6042, 1, N'AnshumanPandey', CAST(N'2020-04-18T10:50:59.760' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6043, 1, N'ShawN', CAST(N'2020-04-18T11:27:55.970' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6044, 1, N'AnshumanPandey', CAST(N'2020-04-18T15:18:43.477' AS DateTime), CAST(N'2020-04-18T15:29:17.817' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6045, 1, N'AnshumanPandey', CAST(N'2020-04-18T15:29:19.920' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6046, 1, N'AnshumanPandey', CAST(N'2020-04-18T16:38:42.137' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6047, 1, N'ShawN', CAST(N'2020-04-18T16:42:09.733' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6048, 1, N'AnshumanPandey', CAST(N'2020-04-18T17:14:37.997' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6049, 1, N'AnshumanPandey', CAST(N'2020-04-18T19:07:38.633' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6050, 1, N'AnshumanPandey', CAST(N'2020-04-18T19:09:19.140' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6051, 1, N'AnshumanPandey', CAST(N'2018-01-18T19:57:52.570' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6052, 1, N'AnshumanPandey', CAST(N'2020-04-18T20:03:29.267' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6053, 1, N'AnshumanPandey', CAST(N'2018-02-19T08:34:12.077' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6054, 1, N'AnshumanPandey', CAST(N'2020-04-19T08:35:48.393' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6055, 1, N'AnshumanPandey', CAST(N'2020-04-19T08:42:48.130' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (6056, 1, N'AnshumanPandey', CAST(N'2020-04-19T09:04:13.180' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7053, 1, N'AnshumanPandey', CAST(N'2020-04-19T09:29:58.447' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7054, 1, N'SwinburnJ', CAST(N'2020-04-19T10:44:19.747' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7055, 1, N'AnshumanPandey', CAST(N'2020-04-19T10:47:11.463' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7056, 1, N'SwinburnJ', CAST(N'2019-04-19T10:49:31.203' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7057, 1, N'AnshumanPandey', CAST(N'2019-04-19T10:49:31.203' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7058, 1, N'AnshumanPandey', CAST(N'2019-04-19T10:49:31.203' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7059, 1, N'AnshumanPandey', CAST(N'2019-04-19T10:49:31.203' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7060, 1, N'SwinburnJ', CAST(N'2019-04-19T10:49:31.203' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7061, 1, N'AnshumanPandey', CAST(N'2020-04-19T16:20:19.280' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
GO
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (7062, 1, N'AnshumanPandey', CAST(N'2020-04-19T17:02:02.790' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8059, 1, N'AnshumanPandey', CAST(N'2020-04-19T17:23:01.860' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8060, 1, N'AnshumanPandey', CAST(N'2020-04-19T18:08:50.140' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8061, 1, N'AnshumanPandey', CAST(N'2020-04-19T18:49:07.480' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8062, 1, N'AnshumanPandey', CAST(N'2020-04-19T18:49:24.230' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8063, 1, N'AnshumanPandey', CAST(N'2020-04-19T20:30:02.760' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8064, 1, N'AnshumanPandey', CAST(N'2020-04-19T20:35:25.207' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8065, 1, N'AnshumanPandey', CAST(N'2020-04-19T20:47:06.000' AS DateTime), CAST(N'2020-04-19T21:25:30.737' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8066, 1, N'AnshumanPandey', CAST(N'2020-04-19T21:25:33.167' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8067, 1, N'AnshumanPandey', CAST(N'2020-04-20T10:35:53.307' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8068, 1, N'guest_user01', CAST(N'2020-04-20T14:27:56.470' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8069, 1, N'AnshumanPandey', CAST(N'2020-04-20T14:50:19.390' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8070, 1, N'AnshumanPandey', CAST(N'2020-04-20T14:54:14.323' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8071, 1, N'AnshumanPandey', CAST(N'2020-04-20T15:11:36.587' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8072, 1, N'guest_user01', CAST(N'2020-04-21T15:08:33.923' AS DateTime), CAST(N'2020-04-21T16:43:32.687' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8073, 1, N'AnshumanPandey', CAST(N'2020-04-21T16:43:35.147' AS DateTime), CAST(N'2020-04-21T17:36:26.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8074, 1, N'AnshumanPandey', CAST(N'2020-04-21T16:50:04.020' AS DateTime), CAST(N'2020-04-21T17:36:26.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8075, 1, N'dddd222', CAST(N'2020-04-21T16:56:03.737' AS DateTime), CAST(N'2020-04-21T17:36:26.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8076, 1, N'qit_user01', CAST(N'2020-04-21T17:00:20.393' AS DateTime), CAST(N'2020-04-21T17:36:26.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8077, 1, N'AnshumanPandey', CAST(N'2020-04-21T17:02:54.970' AS DateTime), CAST(N'2020-04-21T17:36:26.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8078, 1, N'AnshumanPandey', CAST(N'2020-04-21T17:36:28.573' AS DateTime), CAST(N'2020-04-21T18:33:03.470' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8079, 1, N'ggggg', CAST(N'2020-04-21T17:41:11.543' AS DateTime), CAST(N'2020-04-21T18:33:03.470' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8080, 1, N'guest_user01', CAST(N'2020-04-21T18:10:54.880' AS DateTime), CAST(N'2020-04-21T18:33:03.470' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8081, 1, N'a67890', CAST(N'2020-04-21T18:33:05.973' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8082, 1, N'AnshumanPandey', CAST(N'2020-04-21T19:00:36.877' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8083, 1, N'asd123', CAST(N'2020-04-21T19:19:04.630' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8084, 1, N'AnshumanPandey', CAST(N'2020-04-21T19:28:38.140' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8085, 1, N'AnshumanPandey', CAST(N'2020-04-21T19:30:26.480' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8086, 1, N'AnshumanPandey', CAST(N'2020-04-21T19:33:05.823' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8087, 1, N'AnshumanPandey', CAST(N'2020-04-21T19:42:17.430' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8088, 1, N'AnshumanPandey', CAST(N'2020-04-21T20:29:38.813' AS DateTime), CAST(N'2020-04-21T20:36:48.723' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8089, 1, N'AnshumanPandey', CAST(N'2020-04-21T21:36:51.370' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (8090, 1, N'AnshumanPandey', CAST(N'2020-04-21T21:59:59.897' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9072, 1, N'AnshumanPandey', CAST(N'2020-04-21T22:10:58.480' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9073, 1, N'AnshumanPandey', CAST(N'2020-04-21T22:39:15.677' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9074, 1, N'AnshumanPandey', CAST(N'2020-04-21T22:48:37.630' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9075, 1, N'AnshumanPandey', CAST(N'2020-04-21T23:36:22.140' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9076, 1, N'AnshumanPandey', CAST(N'2020-04-21T23:57:03.160' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9077, 1, N'AnshumanPandey', CAST(N'2020-04-22T00:18:41.800' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9078, 1, N'AnshumanPandey', CAST(N'2020-04-22T15:27:31.053' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9079, 1, N'AnshumanPandey', CAST(N'2020-04-22T18:31:07.533' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9080, 1, N'AnshumanPandey', CAST(N'2020-04-22T18:38:01.840' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9081, 1, N'AnshumanPandey', CAST(N'2020-04-22T18:51:08.330' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9082, 1, N'AnshumanPandey', CAST(N'2020-04-22T18:58:44.740' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9083, 1, N'AnshumanPandey', CAST(N'2020-04-22T19:05:20.950' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9084, 1, N'AnshumanPandey', CAST(N'2020-04-22T19:08:27.420' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9085, 1, N'AnshumanPandey', CAST(N'2020-04-22T19:18:34.413' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9086, 1, N'AnshumanPandey', CAST(N'2020-04-22T19:29:00.757' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9087, 1, N'AnshumanPandey', CAST(N'2020-04-22T20:51:06.173' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9088, 1, N'AnshumanPandey', CAST(N'2020-04-22T21:24:32.840' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9089, 1, N'AnshumanPandey', CAST(N'2020-04-22T22:01:59.100' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9090, 1, N'AnshumanPandey', CAST(N'2020-04-22T22:23:05.923' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9091, 1, N'AnshumanPandey', CAST(N'2020-04-22T23:27:51.043' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (9092, 1, N'AnshumanPandey', CAST(N'2020-04-23T15:18:36.870' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10092, 1, N'AnshumanPandey', CAST(N'2020-04-23T16:14:18.927' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10093, 1, N'AnshumanPandey', CAST(N'2020-04-23T16:25:17.177' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10094, 1, N'AnshumanPandey', CAST(N'2020-04-23T16:35:19.370' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10095, 1, N'AnshumanPandey', CAST(N'2020-04-23T16:40:23.410' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10096, 1, N'AnshumanPandey', CAST(N'2020-04-23T17:00:54.403' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10097, 1, N'AnshumanPandey', CAST(N'2020-04-23T17:06:19.460' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10098, 1, N'AnshumanPandey', CAST(N'2020-04-23T21:37:32.553' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10099, 1, N'AnshumanPandey', CAST(N'2020-04-23T22:15:01.537' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10100, 1, N'AnshumanPandey', CAST(N'2020-04-24T14:34:13.760' AS DateTime), CAST(N'2020-04-24T14:41:54.603' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10101, 1, N'AnshumanPandey', CAST(N'2020-04-24T15:36:45.323' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10102, 1, N'AnshumanPandey', CAST(N'2020-04-25T08:37:10.657' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10103, 1, N'AnshumanPandey', CAST(N'2020-04-25T09:27:42.990' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10104, 1, N'AnshumanPandey', CAST(N'2020-04-26T17:09:51.440' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10105, 1, N'AnshumanPandey', CAST(N'2020-04-26T21:28:38.910' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10106, 1, N'AnshumanPandey', CAST(N'2020-04-27T01:32:49.007' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10107, 1, N'AnshumanPandey', CAST(N'2020-04-27T07:39:04.690' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10108, 1, N'AnshumanPandey', CAST(N'2020-04-27T07:44:11.663' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10109, 1, N'AnshumanPandey', CAST(N'2020-04-27T08:14:29.530' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10110, 1, N'AnshumanPandey', CAST(N'2020-04-27T08:24:10.560' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10111, 1, N'AnshumanPandey', CAST(N'2020-04-27T08:54:29.563' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10112, 1, N'AnshumanPandey', CAST(N'2020-04-27T08:54:42.050' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10113, 1, N'AnshumanPandey', CAST(N'2020-04-27T08:56:35.987' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10114, 1, N'AnshumanPandey', CAST(N'2020-04-27T09:01:41.690' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10115, 1, N'AnshumanPandey', CAST(N'2020-04-27T10:16:56.190' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10116, 1, N'AnshumanPandey', CAST(N'2020-04-27T10:39:48.433' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10117, 1, N'AnshumanPandey', CAST(N'2020-04-27T10:40:29.640' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10118, 1, N'AnshumanPandey', CAST(N'2020-04-27T10:41:44.303' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10119, 1, N'AnshumanPandey', CAST(N'2020-04-27T11:46:48.790' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10120, 1, N'AnshumanPandey', CAST(N'2020-04-27T21:55:36.307' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10121, 1, N'AnshumanPandey', CAST(N'2020-04-27T22:01:45.647' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10122, 1, N'AnshumanPandey', CAST(N'2020-04-27T22:05:26.300' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10123, 1, N'AnshumanPandey', CAST(N'2020-04-27T22:06:21.053' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10124, 1, N'AnshumanPandey', CAST(N'2020-04-27T22:08:06.470' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10125, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:02:32.213' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10126, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:06:16.833' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10127, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:12:29.130' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10128, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:15:35.910' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10129, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:26:01.673' AS DateTime), CAST(N'2020-04-27T23:33:23.663' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10130, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:33:25.987' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10131, 1, N'AnshumanPandey', CAST(N'2020-04-27T23:39:43.230' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10132, 1, N'AnshumanPandey', CAST(N'2020-04-28T09:10:50.600' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10133, 1, N'AnshumanPandey', CAST(N'2020-04-28T10:51:58.090' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10134, 1, N'AnshumanPandey', CAST(N'2020-04-28T10:53:37.220' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10135, 1, N'AnshumanPandey', CAST(N'2020-04-28T11:34:25.750' AS DateTime), CAST(N'2020-04-28T11:39:47.093' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10136, 1, N'AnshumanPandey', CAST(N'2020-04-28T11:39:49.363' AS DateTime), CAST(N'2020-04-28T14:32:11.760' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10137, 1, N'AnshumanPandey', CAST(N'2020-04-28T12:31:26.030' AS DateTime), CAST(N'2020-04-28T14:32:11.760' AS DateTime))
GO
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10138, 1, N'AnshumanPandey', CAST(N'2020-04-28T14:11:35.767' AS DateTime), CAST(N'2020-04-28T14:32:11.760' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10139, 1, N'AnshumanPandey', CAST(N'2020-04-28T14:20:25.757' AS DateTime), CAST(N'2020-04-28T14:32:11.760' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10140, 1, N'AnshumanPandey', CAST(N'2020-04-28T14:31:45.427' AS DateTime), CAST(N'2020-04-28T14:32:11.760' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10141, 1, N'AnshumanPandey', CAST(N'2020-04-28T16:46:33.697' AS DateTime), CAST(N'2020-04-28T17:35:01.060' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10142, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:35:03.847' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10143, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:35:58.917' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10144, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:39:06.350' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10145, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:43:02.800' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10146, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:49:42.720' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10147, 1, N'AnshumanPandey', CAST(N'2020-04-28T17:56:37.853' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10148, 1, N'AnshumanPandey', CAST(N'2020-04-28T18:01:28.747' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10149, 1, N'AnshumanPandey', CAST(N'2020-04-29T13:56:56.623' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10150, 1, N'AnshumanPandey', CAST(N'2020-04-29T14:15:24.790' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10151, 1, N'AnshumanPandey', CAST(N'2020-04-29T14:27:21.590' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10152, 1, N'AnshumanPandey', CAST(N'2020-04-29T14:40:34.253' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10153, 1, N'AnshumanPandey', CAST(N'2020-04-29T16:46:49.820' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10154, 1, N'AnshumanPandey', CAST(N'2020-04-29T19:36:45.253' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10155, 1, N'AnshumanPandey', CAST(N'2020-04-29T20:12:58.480' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10156, 1, N'AnshumanPandey', CAST(N'2020-04-29T20:14:35.033' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10157, 1, N'AnshumanPandey', CAST(N'2020-04-29T20:18:48.320' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10158, 1, N'AnshumanPandey', CAST(N'2020-04-29T20:53:50.387' AS DateTime), CAST(N'2020-04-29T20:54:53.540' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10159, 1, N'AnshumanPandey', CAST(N'2020-04-29T21:27:25.163' AS DateTime), CAST(N'2020-04-29T23:06:07.550' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10160, 1, N'AnshumanPandey', CAST(N'2020-04-29T21:29:54.020' AS DateTime), CAST(N'2020-04-29T23:06:07.550' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10161, 1, N'AnshumanPandey', CAST(N'2020-04-29T21:42:04.657' AS DateTime), CAST(N'2020-04-29T23:06:07.550' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10162, 1, N'AnshumanPandey', CAST(N'2020-04-29T22:37:45.453' AS DateTime), CAST(N'2020-04-29T23:06:07.550' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10163, 1, N'AnshumanPandey', CAST(N'2020-04-29T23:05:10.187' AS DateTime), CAST(N'2020-04-29T23:06:07.550' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10164, 1, N'AnshumanPandey', CAST(N'2020-04-29T23:10:31.980' AS DateTime), CAST(N'2020-04-29T23:10:43.620' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10165, 1, N'AnshumanPandey', CAST(N'2020-04-30T11:53:18.753' AS DateTime), CAST(N'2020-04-30T11:57:40.303' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10166, 1, N'AnshumanPandey', CAST(N'2020-04-30T12:20:24.843' AS DateTime), CAST(N'2020-04-30T12:38:25.333' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10167, 1, N'AnshumanPandey', CAST(N'2020-04-30T12:36:35.697' AS DateTime), CAST(N'2020-04-30T12:38:25.333' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10168, 1, N'AnshumanPandey', CAST(N'2020-04-30T12:38:46.180' AS DateTime), CAST(N'2020-04-30T12:40:20.597' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (10169, 1, N'AnshumanPandey', CAST(N'2020-04-30T15:04:22.587' AS DateTime), CAST(N'2020-04-30T15:47:39.930' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11169, 1, N'AnshumanPandey', CAST(N'2020-04-30T15:34:48.363' AS DateTime), CAST(N'2020-04-30T15:47:39.930' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11170, 1, N'AnshumanPandey', CAST(N'2020-04-30T15:47:45.963' AS DateTime), CAST(N'2020-04-30T17:31:53.823' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11171, 1, N'AnshumanPandey', CAST(N'2020-04-30T15:51:46.337' AS DateTime), CAST(N'2020-04-30T17:31:53.823' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11172, 1, N'AnshumanPandey', CAST(N'2020-04-30T16:06:31.797' AS DateTime), CAST(N'2020-04-30T17:31:53.823' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11173, 1, N'AnshumanPandey', CAST(N'2020-04-30T17:27:07.557' AS DateTime), CAST(N'2020-04-30T17:31:53.823' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11174, 1, N'AnshumanPandey', CAST(N'2020-04-30T18:17:44.567' AS DateTime), CAST(N'2020-04-30T19:41:21.343' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11175, 1, N'AnshumanPandey', CAST(N'2020-04-30T18:29:46.950' AS DateTime), CAST(N'2020-04-30T19:41:21.343' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11176, 1, N'AnshumanPandey', CAST(N'2020-04-30T19:16:31.780' AS DateTime), CAST(N'2020-04-30T19:41:21.343' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11177, 1, N'AnshumanPandey', CAST(N'2020-04-30T19:33:58.137' AS DateTime), CAST(N'2020-04-30T19:41:21.343' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11178, 1, N'AnshumanPandey', CAST(N'2020-04-30T19:38:24.353' AS DateTime), CAST(N'2020-04-30T19:41:21.343' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11179, 1, N'AnshumanPandey', CAST(N'2020-04-30T19:43:50.197' AS DateTime), CAST(N'2020-04-30T19:45:09.203' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11180, 1, N'AnshumanPandey', CAST(N'2020-05-01T09:12:07.017' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11181, 1, N'AnshumanPandey', CAST(N'2020-05-01T09:20:16.907' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11182, 1, N'AnshumanPandey', CAST(N'2020-05-01T09:28:32.657' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11183, 1, N'AnshumanPandey', CAST(N'2020-05-01T10:10:06.850' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11184, 1, N'AnshumanPandey', CAST(N'2020-05-01T10:22:01.103' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11185, 1, N'AnshumanPandey', CAST(N'2020-05-01T11:50:16.140' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11186, 1, N'AnshumanPandey', CAST(N'2020-05-01T11:55:53.637' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11187, 1, N'AnshumanPandey', CAST(N'2020-05-01T12:35:47.913' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11188, 1, N'AnshumanPandey', CAST(N'2020-05-01T12:38:33.643' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11189, 1, N'AnshumanPandey', CAST(N'2020-05-01T13:29:16.697' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11190, 1, N'AnshumanPandey', CAST(N'2020-05-01T18:35:04.137' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11191, 1, N'AnshumanPandey', CAST(N'2020-05-01T19:57:41.900' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11192, 1, N'AnshumanPandey', CAST(N'2020-05-01T20:12:50.510' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11193, 1, N'AnshumanPandey', CAST(N'2020-05-01T20:15:38.740' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11194, 1, N'AnshumanPandey', CAST(N'2020-05-01T20:17:40.450' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11195, 1, N'AnshumanPandey', CAST(N'2020-05-01T21:21:04.750' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11196, 1, N'AnshumanPandey', CAST(N'2020-05-01T21:38:48.823' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11197, 1, N'AnshumanPandey', CAST(N'2020-05-01T21:51:58.293' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11198, 1, N'AnshumanPandey', CAST(N'2020-05-01T22:15:55.367' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11199, 1, N'AnshumanPandey', CAST(N'2020-05-01T22:20:24.800' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11200, 1, N'AnshumanPandey', CAST(N'2020-05-01T22:27:48.793' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (11201, 1, N'AnshumanPandey', CAST(N'2020-05-01T22:32:05.937' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12190, 1, N'AnshumanPandey', CAST(N'2020-05-01T22:55:11.240' AS DateTime), CAST(N'2020-05-01T23:00:21.963' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12191, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:00:28.623' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12192, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:10:07.080' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12193, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:20:34.110' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12194, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:26:47.930' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12195, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:31:31.283' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12196, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:33:02.050' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12197, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:34:18.697' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12198, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:36:50.413' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12199, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:41:09.737' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12200, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:46:57.587' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12201, 1, N'AnshumanPandey', CAST(N'2020-05-01T23:57:01.503' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12202, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:11:24.817' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12203, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:16:48.260' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12204, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:21:06.830' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12205, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:23:56.893' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12206, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:36:49.907' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12207, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:38:51.163' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12208, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:42:19.270' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12209, 1, N'AnshumanPandey', CAST(N'2020-05-02T00:56:05.560' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12210, 1, N'AnshumanPandey', CAST(N'2020-05-02T01:01:32.740' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12211, 1, N'AnshumanPandey', CAST(N'2020-05-02T01:15:09.680' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12212, 1, N'AnshumanPandey', CAST(N'2020-05-02T01:17:42.127' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12213, 1, N'AnshumanPandey', CAST(N'2020-05-02T01:50:07.037' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12214, 1, N'AnshumanPandey', CAST(N'2020-05-02T02:01:44.630' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12215, 1, N'AnshumanPandey', CAST(N'2020-05-02T02:03:17.980' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12216, 1, N'AnshumanPandey', CAST(N'2020-05-02T02:24:05.170' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12217, 1, N'AnshumanPandey', CAST(N'2020-05-02T02:49:36.360' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12218, 1, N'AnshumanPandey', CAST(N'2020-05-02T03:03:50.590' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12219, 1, N'AnshumanPandey', CAST(N'2020-05-02T03:06:14.590' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12220, 1, N'AnshumanPandey', CAST(N'2020-05-02T03:16:23.140' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12221, 1, N'AnshumanPandey', CAST(N'2020-05-02T03:28:24.610' AS DateTime), CAST(N'2020-05-02T03:43:14.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12222, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:26:34.730' AS DateTime), CAST(N'2020-05-02T11:57:43.890' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12223, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:32:07.010' AS DateTime), CAST(N'2020-05-02T11:57:43.890' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12224, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:35:39.323' AS DateTime), CAST(N'2020-05-02T11:57:43.890' AS DateTime))
GO
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12225, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:49:46.280' AS DateTime), CAST(N'2020-05-02T11:57:43.890' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12226, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:56:23.303' AS DateTime), CAST(N'2020-05-02T11:57:43.890' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12227, 1, N'AnshumanPandey', CAST(N'2020-05-02T11:57:45.887' AS DateTime), CAST(N'2020-05-02T12:07:25.380' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12228, 1, N'AnshumanPandey', CAST(N'2020-05-02T12:05:05.167' AS DateTime), CAST(N'2020-05-02T12:07:25.380' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12229, 1, N'AnshumanPandey', CAST(N'2020-05-02T16:30:38.423' AS DateTime), CAST(N'2020-05-02T16:58:31.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12230, 1, N'AnshumanPandey', CAST(N'2020-05-02T16:55:49.647' AS DateTime), CAST(N'2020-05-02T16:58:31.290' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12231, 1, N'AnshumanPandey', CAST(N'2020-05-02T16:58:33.610' AS DateTime), CAST(N'2020-05-02T17:05:46.933' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12232, 1, N'AnshumanPandey', CAST(N'2020-05-02T17:04:19.087' AS DateTime), CAST(N'2020-05-02T17:05:46.933' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12233, 1, N'AnshumanPandey', CAST(N'2020-05-02T17:05:49.530' AS DateTime), CAST(N'2020-05-02T17:07:20.780' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12234, 1, N'AnshumanPandey', CAST(N'2020-05-02T17:07:23.667' AS DateTime), CAST(N'2020-05-02T17:18:34.923' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12235, 1, N'AnshumanPandey', CAST(N'2020-05-02T17:16:37.563' AS DateTime), CAST(N'2020-05-02T17:18:34.923' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (12236, 1, N'AnshumanPandey', CAST(N'2020-05-02T17:18:37.020' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13229, 1, N'AnshumanPandey', CAST(N'2020-05-02T18:48:49.080' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13230, 1, N'AnshumanPandey', CAST(N'2020-05-02T20:19:19.563' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13231, 1, N'AnshumanPandey', CAST(N'2020-05-02T20:22:45.547' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13232, 1, N'AnshumanPandey', CAST(N'2020-05-02T20:27:20.860' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13233, 1, N'AnshumanPandey', CAST(N'2020-05-02T20:45:29.120' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13234, 1, N'AnshumanPandey', CAST(N'2020-05-02T20:47:44.873' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13235, 1, N'AnshumanPandey', CAST(N'2020-05-02T21:31:14.260' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13236, 1, N'AnshumanPandey', CAST(N'2020-05-02T21:37:03.497' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13237, 1, N'AnshumanPandey', CAST(N'2020-05-02T21:47:08.723' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13238, 1, N'AnshumanPandey', CAST(N'2020-05-02T22:02:10.917' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13239, 1, N'AnshumanPandey', CAST(N'2020-05-02T22:18:26.823' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13240, 1, N'AnshumanPandey', CAST(N'2020-05-03T10:34:20.337' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13241, 1, N'AnshumanPandey', CAST(N'2020-05-03T10:37:36.400' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13242, 1, N'AnshumanPandey', CAST(N'2020-05-03T11:31:42.107' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13243, 1, N'AnshumanPandey', CAST(N'2020-05-03T11:40:56.687' AS DateTime), CAST(N'2020-05-03T11:44:02.043' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13244, 1, N'AnshumanPandey', CAST(N'2020-05-03T15:23:38.180' AS DateTime), CAST(N'2020-05-03T16:05:32.923' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13245, 1, N'AnshumanPandey', CAST(N'2020-05-03T15:30:27.110' AS DateTime), CAST(N'2020-05-03T16:05:32.923' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13246, 1, N'AnshumanPandey', CAST(N'2020-05-03T15:37:54.117' AS DateTime), CAST(N'2020-05-03T16:05:32.923' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13247, 1, N'AnshumanPandey', CAST(N'2020-05-03T16:51:04.890' AS DateTime), CAST(N'2020-05-03T16:52:53.513' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13248, 1, N'AnshumanPandey', CAST(N'2020-05-03T16:52:55.957' AS DateTime), CAST(N'2020-05-03T16:59:05.380' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13249, 1, N'AnshumanPandey', CAST(N'2020-05-03T16:56:01.603' AS DateTime), CAST(N'2020-05-03T16:59:05.380' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13250, 1, N'AnshumanPandey', CAST(N'2020-05-03T16:58:37.220' AS DateTime), CAST(N'2020-05-03T16:59:05.380' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13251, 1, N'AnshumanPandey', CAST(N'2020-05-03T17:03:08.803' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13252, 1, N'AnshumanPandey', CAST(N'2020-05-03T17:32:43.910' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13253, 1, N'AnshumanPandey', CAST(N'2020-05-04T13:41:40.407' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13254, 1, N'AnshumanPandey', CAST(N'2020-05-04T15:47:58.780' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13255, 1, N'AnshumanPandey', CAST(N'2020-05-04T16:25:22.053' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13256, 1, N'AnshumanPandey', CAST(N'2020-05-04T21:22:30.210' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13257, 1, N'AnshumanPandey', CAST(N'2020-05-04T21:27:08.490' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13258, 1, N'AnshumanPandey', CAST(N'2018-02-05T10:30:39.020' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13259, 1, N'AnshumanPandey', CAST(N'2020-05-05T10:37:29.520' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13260, 1, N'AnshumanPandey', CAST(N'2020-05-05T11:31:44.263' AS DateTime), CAST(N'2020-05-05T11:33:32.127' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13261, 1, N'AnshumanPandey', CAST(N'2020-05-06T14:02:57.717' AS DateTime), CAST(N'2020-05-06T14:05:35.253' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13262, 1, N'AnshumanPandey', CAST(N'2018-03-11T11:25:42.127' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13263, 1, N'AnshumanPandey', CAST(N'2020-05-11T11:28:16.813' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (13264, 1, N'AnshumanPandey', CAST(N'2020-05-11T17:46:27.787' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (14264, 1, N'AnshumanPandey', CAST(N'2020-05-12T14:39:22.627' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (14265, 1, N'AnshumanPandey', CAST(N'2020-05-13T13:49:30.023' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (14266, 1, N'AnshumanPandey', CAST(N'2020-05-18T14:06:20.687' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (14267, 1, N'AnshumanPandey', CAST(N'2020-05-18T14:15:12.840' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (14268, 1, N'AnshumanPandey', CAST(N'2020-05-19T16:19:25.380' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15268, 1, N'AnshumanPandey', CAST(N'2020-05-19T18:42:07.880' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15269, 1, N'AnshumanPandey', CAST(N'2020-05-20T11:32:43.370' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15270, 1, N'AnshumanPandey', CAST(N'2020-05-20T12:47:07.947' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15271, 1, N'AnshumanPandey', CAST(N'2020-05-20T14:08:02.780' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15272, 1, N'AnshumanPandey', CAST(N'2020-05-20T14:13:04.913' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15273, 1, N'AnshumanPandey', CAST(N'2020-05-21T18:47:20.597' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15274, 1, N'AnshumanPandey', CAST(N'2020-05-28T16:59:54.910' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15275, 1, N'AnshumanPandey', CAST(N'2020-05-30T08:30:13.957' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15276, 1, N'AnshumanPandey', CAST(N'2020-05-30T09:10:01.190' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15277, 1, N'AnshumanPandey', CAST(N'2020-05-30T09:28:19.100' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15278, 1, N'AnshumanPandey', CAST(N'2020-05-30T20:35:15.553' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (15279, 1, N'AnshumanPandey', CAST(N'2020-06-10T16:38:22.927' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16279, 1, N'AnshumanPandey', CAST(N'2018-02-10T17:03:36.897' AS DateTime), CAST(N'2020-06-10T17:05:48.830' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16280, 1, N'AnshumanPandey', CAST(N'2020-06-10T17:05:52.297' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16281, 1, N'AnshumanPandey', CAST(N'2020-06-10T17:20:38.440' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16282, 1, N'AnshumanPandey', CAST(N'2020-06-11T08:07:21.830' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16283, 1, N'AnshumanPandey', CAST(N'2020-06-12T07:28:01.127' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16284, 1, N'AnshumanPandey', CAST(N'2020-06-12T09:31:37.137' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16285, 1, N'AnshumanPandey', CAST(N'2020-06-12T10:53:12.193' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16286, 1, N'AnshumanPandey', CAST(N'2020-06-12T11:29:06.027' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16287, 1, N'AnshumanPandey', CAST(N'2020-06-12T16:35:35.840' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (16288, 1, N'AnshumanPandey', CAST(N'2018-02-12T18:34:35.940' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (17288, 1, N'AnshumanPandey', CAST(N'2020-06-12T20:49:08.157' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (17289, 1, N'AnshumanPandey', CAST(N'2020-06-13T06:55:01.543' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (17290, 1, N'AnshumanPandey', CAST(N'2020-06-13T07:41:21.860' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (17291, 1, N'AnshumanPandey', CAST(N'2020-06-13T15:15:26.437' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (18291, 1, N'AnshumanPandey', CAST(N'2020-06-13T17:16:47.260' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19291, 1, N'AnshumanPandey', CAST(N'2020-06-13T21:54:46.267' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19292, 1, N'AnshumanPandey', CAST(N'2020-06-15T09:02:21.737' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19293, 1, N'AnshumanPandey', CAST(N'2020-06-15T14:19:20.793' AS DateTime), CAST(N'2020-06-15T14:32:48.623' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19294, 1, N'AnshumanPandey', CAST(N'2020-06-15T14:32:53.497' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19295, 1, N'AnshumanPandey', CAST(N'2020-06-17T07:09:36.803' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19296, 1, N'AnshumanPandey', CAST(N'2020-06-17T07:20:40.550' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19297, 1, N'AnshumanPandey', CAST(N'2020-06-17T20:07:22.147' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19298, 1, N'AnshumanPandey', CAST(N'2020-06-17T20:13:26.057' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19299, 1, N'AnshumanPandey', CAST(N'2020-06-17T20:22:21.283' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19300, 1, N'AnshumanPandey', CAST(N'2020-06-17T20:27:40.020' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19301, 1, N'AnshumanPandey', CAST(N'2020-06-17T21:02:22.233' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19302, 1, N'AnshumanPandey', CAST(N'2020-06-17T21:04:01.410' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19303, 1, N'AnshumanPandey', CAST(N'2020-06-17T21:12:54.117' AS DateTime), CAST(N'2020-06-17T21:24:18.313' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19304, 1, N'AnshumanPandey', CAST(N'2020-06-17T22:02:23.980' AS DateTime), CAST(N'2020-06-18T07:55:34.697' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19305, 1, N'AnshumanPandey', CAST(N'2020-06-18T07:55:10.067' AS DateTime), CAST(N'2020-06-18T07:55:34.697' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19306, 40, N'AnshuSuperAdmin', CAST(N'2020-06-18T07:56:09.690' AS DateTime), CAST(N'2020-06-18T11:10:49.520' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19307, 1, N'AnshumanPandey', CAST(N'2020-06-18T11:00:21.560' AS DateTime), CAST(N'2020-06-18T11:10:49.520' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19308, 40, N'AnshuSuperAdmin', CAST(N'2020-06-18T11:11:36.387' AS DateTime), CAST(N'2020-06-18T11:13:42.473' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19309, 1, N'AnshumanPandey', CAST(N'2020-06-18T11:13:46.380' AS DateTime), CAST(N'2020-06-18T11:15:43.717' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19310, 1, N'AnshumanPandey', CAST(N'2020-06-18T11:15:59.967' AS DateTime), CAST(N'2020-06-18T16:02:52.793' AS DateTime))
GO
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19311, 1, N'AnshumanPandey', CAST(N'2020-06-18T13:54:41.787' AS DateTime), CAST(N'2020-06-18T16:02:52.793' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (19312, 1, N'AnshumanPandey', CAST(N'2020-06-18T16:20:58.613' AS DateTime), CAST(N'2020-06-19T17:14:05.783' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (20305, 1, N'AnshumanPandey', CAST(N'2020-06-19T14:26:35.303' AS DateTime), CAST(N'2020-06-19T17:14:05.783' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (21305, 1, N'AnshumanPandey', CAST(N'2020-06-20T16:40:00.180' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (21306, 1, N'AnshumanPandey', CAST(N'2020-06-20T16:50:45.073' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (21307, 1, N'AnshumanPandey', CAST(N'2020-06-20T17:52:17.620' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (21308, 1, N'AnshumanPandey', CAST(N'2020-06-20T21:04:56.657' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (21309, 1, N'AnshumanPandey', CAST(N'2020-06-20T21:14:19.440' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22305, 1, N'AnshumanPandey', CAST(N'2020-06-21T09:07:54.183' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22306, 1, N'AnshumanPandey', CAST(N'2020-06-21T10:17:49.377' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22307, 1, N'AnshumanPandey', CAST(N'2020-06-21T10:44:46.553' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22308, 1, N'AnshumanPandey', CAST(N'2020-06-21T10:54:13.693' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22309, 1, N'AnshumanPandey', CAST(N'2020-06-21T17:38:55.620' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22310, 1, N'AnshumanPandey', CAST(N'2020-06-21T17:46:09.103' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (22311, 1, N'AnshumanPandey', CAST(N'2020-06-21T18:48:07.650' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23309, 1, N'AnshumanPandey', CAST(N'2020-06-21T21:34:03.780' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23310, 1, N'AnshumanPandey', CAST(N'2020-06-21T21:40:30.943' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23311, 1, N'AnshumanPandey', CAST(N'2020-06-22T07:02:12.830' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23312, 1, N'AnshumanPandey', CAST(N'2020-06-22T07:36:34.300' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23313, 1, N'AnshumanPandey', CAST(N'2020-06-22T08:25:28.640' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (23314, 1, N'AnshumanPandey', CAST(N'2020-06-22T09:49:24.067' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (24311, 1, N'AnshumanPandey', CAST(N'2020-06-22T10:46:41.417' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (24312, 1, N'AnshumanPandey', CAST(N'2020-06-22T12:50:57.953' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (24313, 1, N'AnshumanPandey', CAST(N'2020-06-22T15:26:56.690' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (24314, 1, N'AnshumanPandey', CAST(N'2020-06-22T16:48:24.593' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (25311, 1, N'AnshumanPandey', CAST(N'2020-06-23T02:46:19.837' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (26311, 1, N'AnshumanPandey', CAST(N'2020-06-23T03:28:06.743' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (26312, 6, N'ShawN', CAST(N'2020-06-23T04:28:13.280' AS DateTime), CAST(N'2020-06-23T04:28:48.593' AS DateTime))
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (26313, 13, N'guest_user01', CAST(N'2020-06-23T04:30:09.730' AS DateTime), NULL)
INSERT [dbo].[UserLoginAuditTrail] ([ID], [User_ID], [UserID], [LoginDateTime], [LogoutDateTime]) VALUES (26314, 1, N'AnshumanPandey', CAST(N'2020-06-23T06:08:21.483' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserLoginAuditTrail] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (1, N'anshuman@gvtechsolution.com', N'Admin', N'12344', N'Anshuman', N'Pandey', N'AnshumanPandey', N'test', N'24', NULL, N'1', CAST(N'2019-11-09T05:40:33.350' AS DateTime), 1, CAST(N'2020-06-23T06:08:21.483' AS DateTime))
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (2, N'', N'Admin', N'N100001', N'Katie', N'Elcock', N'Elcockk', N'Governance', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (3, N'', N'Admin', N'N100001', N'Darren', N'Lee', N'leeD', N'Governance', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (4, N'', N'Admin', N'N100001', N'Eghosa', N'Bazuaye', N'Bazuaye', N'Informatics', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (5, N'', N'MEO', N'N100001', N'Sam', N'Harmer', N'HarmerS', N'Informatics', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (6, N'', N'ME', N'C100002', N'Natalie', N'Shaw', N'ShawN', N'Respiratory', N'24', NULL, N'1', CAST(N'2019-11-29T16:57:18.507' AS DateTime), 1, CAST(N'2020-06-23T04:28:13.280' AS DateTime))
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (7, N'', N'ME', N'C100003', N'Juliet', N'Murphy', N'MurphyJ', N'Governance', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (8, N'', N'Consultant', N'C100004', N'Jon', N'Swinburn', N'SwinburnJ', N'Cardiology', N'24', NULL, N'1', CAST(N'2019-11-28T16:11:41.363' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (9, N'', N'ME', N'C100005', N'bhavesh', N'Sachdev', N'bhaveshs', N'Cardiology', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (10, NULL, N'Admin', N'C1111', N'NHS', N'Demo User', N'nhsdemo ', NULL, N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (11, N'', N'Admin', N'N100001', N'Orlando', N'Agrippa', N'Orlando', N'Governance', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (12, N'', N'QAP', N'', N'User', N'PP', N'qit_user01', N'test', N'24', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (13, NULL, N'Admin', NULL, N'Guest', N'User', N'guest_user01', N'test', N'24', NULL, N'1', CAST(N'2019-11-07T11:59:13.043' AS DateTime), 1, CAST(N'2020-06-23T04:30:09.727' AS DateTime))
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (16, N'anshuman.pandey@draperanddash.com', N'ME', NULL, N'A', N'Pandey', N'a67890', N'General Surgery', N'24', CAST(N'2018-11-07T07:32:05.483' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (18, N'dd@dddd.com', N'Consultant', N'2323ewew', N'aadd', N'sseee', N'ddddww', N'Respiratory', N'24', CAST(N'2018-11-08T17:47:06.047' AS DateTime), N'1', CAST(N'2019-11-09T05:39:52.693' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (19, N'a@p.com', N'MEO', N'', N'A', N'P', N'asd123', N'Diabetes & endocrinology', N'24', CAST(N'2019-11-28T06:19:49.740' AS DateTime), N'1', CAST(N'2019-11-28T06:33:15.760' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (20, N'm@k.com', N'Admin', N'', N's', N's', N'op09', N'Renal', N'24', CAST(N'2019-11-28T06:41:07.440' AS DateTime), N'1', CAST(N'2019-11-28T06:41:50.000' AS DateTime), 0, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (21, N'medloc@medloc-maroc.com', N'MEO', N'', N'Anshuman', N'Pandey', N'dddd222', N'Rheumatology', N'24', CAST(N'2019-11-28T06:54:02.057' AS DateTime), N'1', CAST(N'2019-11-30T14:42:57.070' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (22, N'm@i.com', N'QAP1', N'', N'M', N'i', N'dfg111', N'Stroke medicine', N'24', CAST(N'2019-11-28T06:58:32.333' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (23, N's@o.com', N'Admin', N'', N'a', N'aa', N'lll', N'Rheumatology', N'24', CAST(N'2019-11-28T06:59:46.803' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (24, N'j@k.com', N'Consultant', N'', N's', N'a', N'sss11', N'Acute medicine', N'24', CAST(N'2019-11-28T07:00:18.273' AS DateTime), NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (27, N'anshuman@gvtechsolution.com', N'ME', N'', N'Anshuman', N'Pandey', N'ggggg', N'Trauma & orthopaedics', N'27', CAST(N'2019-12-05T10:45:05.583' AS DateTime), N'1', CAST(N'2019-12-18T18:46:58.020' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (32, N'anshumanpandey71@gmail.com', N'Consultant', N'', N'Anshuman', N'Pandey', N'mmmmmm', N'Stroke medicine', N'32', CAST(N'2019-12-05T10:54:08.150' AS DateTime), N'1', CAST(N'2019-12-05T11:08:17.803' AS DateTime), 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (33, N'anshuman1@gvtechsolution.com', NULL, N'', N'Anshuman', N'Pandey', N'333aaa', N'', N'33', CAST(N'2020-02-05T13:33:08.460' AS DateTime), NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (34, N'anshuman2@gvtechsolution.com', N'MEO', N'', N'Anshuman', N'Pandey', N'444111', N'', N'34', CAST(N'2020-02-05T13:37:00.417' AS DateTime), NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (36, N'g@g.com', N'Consultant', N'', N'g', N'p', N'gp12', N'', N'36', CAST(N'2020-03-27T13:16:55.767' AS DateTime), NULL, NULL, 0, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (40, N'a@p.com', N'SuperAdmin', NULL, N'Anshu', N'Pandey', N'AnshuSuperAdmin', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-06-18T11:11:36.387' AS DateTime))
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (42, N's@d.c', N'Consultant', N'', N's', N'd', N'sdfc', N'', N'1', CAST(N'2020-06-18T14:34:20.597' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([ID], [Email], [Role], [Code], [FirstName], [LastName], [UserID], [Speciality], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsApproved], [LastLoginDateTime]) VALUES (1044, N'rick.little@right-cars.com', N'MEO', N'', N'Rick', N'Little', N'rlt123', N'', N'1', CAST(N'2020-06-20T17:54:36.650' AS DateTime), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__1788CCAD94803AF4]    Script Date: 23/06/2020 14:37:05 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLoginAuditTrail]  WITH CHECK ADD  CONSTRAINT [FK_UserLoginAuditTrail_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserLoginAuditTrail] CHECK CONSTRAINT [FK_UserLoginAuditTrail_Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetActiveUsers]    Script Date: 23/06/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetActiveUsers] 
@StartDate datetime,
@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    create table #ActiveUsers
	(
		RowCt int identity(1,1),
		Yr int,
		Mnth varchar(10),
		Wk datetime,
		Dy datetime,
		UserName varchar(104),
		ActivityCount int
	)
	
	Insert into #ActiveUsers
	select DATEPART(YEAR, LoginDateTime), Convert(char(3), LoginDateTime, 0)+'-'+ RIGHT(CONVERT(VARCHAR(8), LoginDateTime, 1),2), DATEADD(dd, 7-(DATEPART(dw, LoginDateTime)), LoginDateTime), Convert(Date,LoginDateTime), UserLoginAuditTrail.UserID, Count(UserLoginAuditTrail.UserID) from UserLoginAuditTrail inner Join Users on Users.ID = UserLoginAuditTrail.User_ID where Upper(Users.[Role]) <> 'SUPERADMIN' group by UserLoginAuditTrail.UserID, LoginDateTime
	
	select Yr as [DistinctYear], Mnth as [Month], Wk as [Week], Dy as [Day], UserName, ActivityCount from #ActiveUsers
	where Dy >= @StartDate and Dy <= @EndDate
	Order By Yr, Mnth asc

	drop table #ActiveUsers
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserCount]    Script Date: 23/06/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserCount] 
@StartDate datetime,
@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @UsedLicense int
	declare @UnusedLicense int
	declare @LicenseCount int

	select @LicenseCount = LicenseNumber from Licenses

	select @UsedLicense = Count(*) from Users where IsApproved = 1

	set @UnusedLicense = @LicenseCount - @UsedLicense

	create table #DistinctYear
	(
		RowCt int identity(1,1),
		Mnth varchar(10),
		Wk datetime,
		Dy datetime,
		UsedLicense int,
		UnusedLicense int,
		Yr int
	)

	declare @count int
	declare @rowct int
	declare @DistinctYear varchar(100)
	set @DistinctYear = ''
	set @count = 1

	Insert into #DistinctYear(Mnth, Wk, Dy, Yr, UsedLicense, UnusedLicense)
	select distinct Convert(char(3), CreatedDate, 0)+'-'+ RIGHT(CONVERT(VARCHAR(8), CreatedDate, 1),2), DATEADD(dd, 7-(DATEPART(dw, CreatedDate)), CreatedDate), CreatedDate, DATEPART(YEAR, CreatedDate), Count(*), @LicenseCount - Count(*) from Users where CreatedDate is not null and IsApproved = 1 and Upper([Role]) <> 'SUPERADMIN' group by CreatedDate
	select @rowct = Count(*) from #DistinctYear

	select Mnth as [Month], Wk as [Week], Dy as [Day], Yr as DistinctYear, UsedLicense, 
	UnusedLicense, @LicenseCount as LicenseCount from #DistinctYear where Dy >= @StartDate and Dy <= @EndDate order by Yr, Dy asc

	--while @count <= @rowct
	--Begin
	--	if(@count < @rowct)
	--		select @DistinctYear += convert(varchar(10),Yr) + ',' from #DistinctYear where RowCt = @count
	--	else if @count = @rowct
	--		select @DistinctYear += convert(varchar(10),Yr) from #DistinctYear where RowCt = @count

	--	Set @count = @count + 1
	--End  

	drop table #DistinctYear
	--select @UsedLicense as UsedLicense, @UnusedLicense as UnusedLicense, @DistinctYear as DistinctYear, @LicenseCount as LicenseCount
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserModuleDetails]    Script Date: 23/06/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserModuleDetails] 
@StartDate datetime,
@EndDate datetime
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ID, PatientID, ModuleName, UserName, StartTime, EndTime, [Year], Convert(char(3), 
	StartTime, 0)+'-'+ RIGHT(CONVERT(VARCHAR(8), StartTime, 1),2) as [Month], [Quarter], [Week], 
	DATEDIFF(minute, StartTime, EndTime) as TimeSpan, 1 as ActivityCount from ModuleTimeSpan where StartTime >= @StartDate and StartTime <= @EndDate order by [Year], [Month], [Quarter],[Week] 
END
GO
