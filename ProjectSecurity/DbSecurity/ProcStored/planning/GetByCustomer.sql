CREATE PROCEDURE [dbo].[GetByCustomer]
	@Customer int
	
AS
begin
	SELECT EndTime, Customer, StartTime, EndTime from ScheduleGuard where Customer = @Customer
	end
