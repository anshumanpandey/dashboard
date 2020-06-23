USE [corsrbhprod_dd]
GO
/****** Object:  Table [dbo].[Licenses]    Script Date: 23/06/2020 15:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LicenseNumber] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Licenses] ON 

INSERT [dbo].[Licenses] ([ID], [LicenseNumber], [UpdatedDate], [UpdatedBy]) VALUES (1, 15, CAST(N'2020-06-17T21:16:13.357' AS DateTime), N'AnshumanPandey')
SET IDENTITY_INSERT [dbo].[Licenses] OFF
