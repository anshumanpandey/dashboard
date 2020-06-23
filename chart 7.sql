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
CREATE PROCEDURE usp_GetUserSessionCount
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
