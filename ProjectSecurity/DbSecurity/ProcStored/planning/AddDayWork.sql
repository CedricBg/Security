CREATE PROCEDURE [dbo].[AddDayWork]
	@IdEmployee int,
	@IdCustomer int,
	@Start Date,
	@End Date
AS
Begin
	INSERT INTO ScheduleGuard (IdCustomer,IdEmployee,StartTime,EndTime) Values(@IdCustomer, @IdEmployee, @Start, @End)
End
