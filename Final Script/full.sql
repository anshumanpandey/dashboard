USE [NHS]
GO
/****** Object:  Table [dbo].[Licenses]    Script Date: 6/24/2020 12:45:53 AM ******/
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
/****** Object:  Table [dbo].[ModuleTimeSpan]    Script Date: 6/24/2020 12:45:53 AM ******/
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
	[TimeSpan] [int] NULL,
 CONSTRAINT [PK_ModuleTimeSpan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginAuditTrail]    Script Date: 6/24/2020 12:45:53 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/24/2020 12:45:53 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLoginAuditTrail]  WITH CHECK ADD  CONSTRAINT [FK_UserLoginAuditTrail_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserLoginAuditTrail] CHECK CONSTRAINT [FK_UserLoginAuditTrail_Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetActiveUsers]    Script Date: 6/24/2020 12:45:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetLicenseDetails]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetLicenseDetails]
	-- Add the parameters for the stored procedure here
@StartDate datetime,
@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @LicenseCount int
	declare @UsedLicense int
	declare @UnusedLicense int

	select @LicenseCount = LicenseNumber from Licenses where UpdatedDate >= @StartDate and UpdatedDate <= @EndDate
	select @UsedLicense = Count(*) from Users where IsApproved = 1 and CreatedDate >= @StartDate and CreatedDate <= @EndDate
	select @UnusedLicense = @LicenseCount - @UsedLicense

	select @LicenseCount as 'LicenseCount', @UsedLicense as 'UsedLicense', @UnusedLicense as 'UnusedLicense' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetModuleTimeSpan]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetModuleTimeSpan] 
	-- Add the parameters for the stored procedure here
	@StartDate datetime,
	@EndDate datetime,
	@IsAverage bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    create table #Modules
	(
		ModuleName varchar(100),
		AvgTimeSpan decimal(18,2)
	)

	If @IsAverage = 1
	Begin
	insert into #Modules 
	select 'QAP', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'QAP'

	insert into #Modules 
	select 'ME', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'ME'

	insert into #Modules 
	select 'MEO', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'MEO'

	insert into #Modules 
	select 'SJR1', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR1'
	
	insert into #Modules 
	select 'SJR2', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR2' 

	insert into #Modules 
	select 'SJR Outcome', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR Outcome' 

	insert into #Modules 
	select 'Coding Review', Avg(TimeSpan) from ModuleTimeSpan where ModuleName = 'Coding Review' 
	End
	Else
	Begin
			insert into #Modules 
	select 'QAP', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'QAP'

	insert into #Modules 
	select 'ME', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'ME'

	insert into #Modules 
	select 'MEO', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'MEO'

	insert into #Modules 
	select 'SJR1', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR1'
	
	insert into #Modules 
	select 'SJR2', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR2' 

	insert into #Modules 
	select 'SJR Outcome', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'SJR Outcome' 

	insert into #Modules 
	select 'Coding Review', Sum(TimeSpan) from ModuleTimeSpan where ModuleName = 'Coding Review' 
	End
	select * from #Modules

	drop table #Modules
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserActivity]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserActivity]
	-- Add the parameters for the stored procedure here
@StartDate datetime,
@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	create table #UserActivity
	(
		UserName varchar(104),
		ActivityCount int null
	)

	Insert into #UserActivity
	select UserName, Count(*) from ModuleTimeSpan where StartTime >= @StartDate and StartTime <= @EndDate 
	group by UserName

	select * from #UserActivity

	drop table #UserActivity
End
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserCount]    Script Date: 6/24/2020 12:45:53 AM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetUserModuleDetails]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[usp_GetUserModuleInfo]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_GetUserModuleInfo]
	-- Add the parameters for the stored procedure here
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    create table #UserModule
(
	RowID int identity(1,1),
	UserName varchar(104),
	QAP int null,
	ME int null, 
	MEO int null,
	SJR1 int null,
	SJROutcome int null,
	SJR2 int null,
	CodingReview int null
)

declare @QAP int
declare @ME int
declare @MEO int
declare @SJR1 int
declare @SJROutcome int
declare @SJR2 int
declare @CodingReview int

Insert into #UserModule 
select distinct UserName, null, null, null, null, null, null, null from ModuleTimeSpan where StartTime >= @StartDate and StartTime <= @EndDate

declare @count int
declare @rowcount int
set @count = 1

select @rowcount = Count(*) from #UserModule
while @count <= @rowcount
Begin
declare @UserName varchar(104)
select @UserName = UserName from #UserModule where RowID = @count
select @QAP = Count(*) from ModuleTimeSpan where ModuleName = 'QAP' and UserName = @UserName and StartTime >= @StartDate and StartTime <= @EndDate  
select @ME = Count(*) from ModuleTimeSpan where ModuleName = 'ME' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @MEO = Count(*) from ModuleTimeSpan where ModuleName = 'MEO' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJR1 = Count(*) from ModuleTimeSpan where ModuleName = 'SJR1' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJROutcome = Count(*) from ModuleTimeSpan where ModuleName = 'SJR Outcome' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJR2 = Count(*) from ModuleTimeSpan where ModuleName = 'SJR2' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @CodingReview = Count(*) from ModuleTimeSpan where ModuleName = 'Coding Review' and UserName = @UserName and StartTime >= @StartDate and StartTime <= @EndDate

update #UserModule
set QAP = @QAP,
ME = @ME,
MEO = @MEO,
SJR1 = @SJR1,
SJROutcome = @SJROutcome,
SJR2 = @SJR2,
CodingReview = @CodingReview
where UserName = @UserName
Set @count = @count + 1
End
select UserName, QAP, ME, MEO, SJR1, SJROutcome, SJR2, CodingReview from #UserModule

drop table #UserModule
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserModuleInformation]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[usp_GetUserModuleInformation] 
	-- Add the parameters for the stored procedure here
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    create table #UserModule
(
	RowID int identity(1,1),
	UserName varchar(104),
	QAP int null,
	ME int null, 
	MEO int null,
	SJR1 int null,
	SJROutcome int null,
	SJR2 int null,
	CodingReview int null
)

declare @QAP int
declare @ME int
declare @MEO int
declare @SJR1 int
declare @SJROutcome int
declare @SJR2 int
declare @CodingReview int

Insert into #UserModule 
select distinct UserName, null, null, null, null, null, null, null from ModuleTimeSpan where StartTime >= @StartDate and StartTime <= @EndDate

declare @count int
declare @rowcount int
set @count = 1

select @rowcount = Count(*) from #UserModule
while @count <= @rowcount
Begin
declare @UserName varchar(104)
select @UserName = UserName from #UserModule where RowID = @count
select @QAP = Count(*) from ModuleTimeSpan where ModuleName = 'QAP' and UserName = @UserName and StartTime >= @StartDate and StartTime <= @EndDate  
select @ME = Count(*) from ModuleTimeSpan where ModuleName = 'ME' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @MEO = Count(*) from ModuleTimeSpan where ModuleName = 'MEO' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJR1 = Count(*) from ModuleTimeSpan where ModuleName = 'SJR1' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJROutcome = Count(*) from ModuleTimeSpan where ModuleName = 'SJR Outcome' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @SJR2 = Count(*) from ModuleTimeSpan where ModuleName = 'SJR2' and UserName = @UserName and  StartTime >= @StartDate and StartTime <= @EndDate
select @CodingReview = Count(*) from ModuleTimeSpan where ModuleName = 'Coding Review' and UserName = @UserName and StartTime >= @StartDate and StartTime <= @EndDate

update #UserModule
set QAP = @QAP,
ME = @ME,
MEO = @MEO,
SJR1 = @SJR1,
SJROutcome = @SJROutcome,
SJR2 = @SJR2,
CodingReview = @CodingReview
where UserName = @UserName
Set @count = @count + 1
End
select UserName, QAP, ME, MEO, SJR1, SJROutcome, SJR2, CodingReview from #UserModule

drop table #UserModule
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserSessionCount]    Script Date: 6/24/2020 12:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetUserSessionCount]
	-- Add the parameters for the stored procedure here
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    create table #UserSession
(
	RowID int identity(1,1),
	UserName varchar(104),
	SessionCount int null
)

Insert into #UserSession
select distinct UserID, null from UserLoginAuditTrail where LoginDateTime >= @StartDate and LoginDateTime <= @EndDate

declare @count int
declare @rowct int
set @count = 1
select @rowct = Count(*) from #UserSession

declare @ActivityCount int
declare @UserName varchar(104)
while @count <= @rowct
Begin
	select @UserName = UserName from #UserSession where RowID = @count
	select @ActivityCount = COUNT(*) from UserLoginAuditTrail where UserID = @UserName and  LoginDateTime >= @StartDate and LoginDateTime <= @EndDate
	update #UserSession
	set SessionCount = @ActivityCount
	where UserName = @UserName
	Set @count = @count + 1
End

select * from #UserSession

drop table #UserSession
END
GO
