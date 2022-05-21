CREATE PROCEDURE [dbo].[getOneByCustomer]
	@Employee int
	
AS
begin
	SELECT * from ScheduleGuard where IdEmployee = @Employee
	end
