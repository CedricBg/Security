CREATE PROCEDURE [dbo].[PutPlanning]
	@Employee int,
	@Customer int,
	@Sart Date,
	@End Date
AS
Begin
	Update ScheduleGuard SET IdCustomer=@Customer, IdEmployee=@Employee,StartTime=@Sart,EndTime=@End
End
