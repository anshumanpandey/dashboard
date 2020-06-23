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
CREATE PROCEDURE usp_GetLicenseDetails
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
