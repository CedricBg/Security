CREATE PROCEDURE [dbo].[getOneByEmployee]
	@Employee int
	
AS
begin
	SELECT EndTime, Customer,StartTime, IdEmployee from ScheduleGuard where IdEmployee = @Employee
	end