-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Alter PROCEDURE usp_GetUserModuleDetails 
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
