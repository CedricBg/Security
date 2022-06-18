CREATE PROCEDURE [dbo].[PutPlanning]
	@Employee int,
	@Customer varchar(50),
	@Sart varchar(50),
	@End varchar(50)
AS
Begin
	Update ScheduleGuard SET Customer=@Customer, IdEmployee=@Employee,StartTime=@Sart,EndTime=@End where IdEmployee=@Employee and Customer = @Customer
End
