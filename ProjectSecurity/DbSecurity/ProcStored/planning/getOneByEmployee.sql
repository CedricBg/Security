CREATE PROCEDURE [dbo].[getOneByEmployee]
	@Employee int
	
AS
begin
	SELECT EndTime, IdCustomer, IdCustomer,StartTime from ScheduleGuard where IdEmployee = @Employee
	end