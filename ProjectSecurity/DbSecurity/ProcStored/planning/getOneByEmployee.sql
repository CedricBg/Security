CREATE PROCEDURE [dbo].[getOneByEmployee]
	@Employee int
	
AS
begin
	SELECT * from ScheduleGuard where IdEmployee = @Employee
	end