CREATE PROCEDURE [dbo].[AddDayWork]
	@IdEmployee int,
	@Customer varchar(50),
	@Start varchar(50),
	@End varchar(50)
AS
Begin
	INSERT INTO ScheduleGuard (Customer,IdEmployee,StartTime,EndTime) Values(@Customer, @IdEmployee, @Start, @End)
End
