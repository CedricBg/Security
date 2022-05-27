CREATE PROCEDURE [dbo].[StartWork]
	@IdCustomer int,
	@IdEmployee int
AS
Begin
	Declare @Arrive Date
	Declare @Depart Date

	SET @Arrive  = (SELECT TOP 1 ArrivingTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC )
	SET @Depart  = (SELECT TOP 1 DepartureTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC )
	
	if ((@Arrive IS NULL 
	And @Depart  IS NULL)

	or (@Depart  IS not NULL
	And @Arrive  IS not NULL))
	Begin
	INSERT INTO Start_end_Time (IdCustomer,IdEmployee,ArrivingTime) OUTPUT inserted.IdStart Values(@IdCustomer, @IdEmployee, GETDATE())
	end
	else
		begin
			return 0
		end

End
