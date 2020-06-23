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
ALTER PROCEDURE usp_GetModuleTimeSpan 
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
