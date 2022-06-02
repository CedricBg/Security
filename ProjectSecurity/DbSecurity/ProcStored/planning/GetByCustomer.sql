CREATE PROCEDURE [dbo].[GetByCustomer]
	@Customer int
	
AS
begin
	SELECT EndTime, IdCustomer, IdCustomer,StartTime from ScheduleGuard where IdCustomer = @Customer
	end
