CREATE PROCEDURE [dbo].[StartWork]
	@IdCustomer int,
	@IdEmployee int
AS
Begin


	if ((SELECT TOP 1 DepartureTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC ) is Null 
	And (SELECT TOP 1 ArrivingTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC  ) IS NULL)
	or ((SELECT TOP 1 DepartureTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC ) is Not Null 
	And (SELECT TOP 1 ArrivingTime FROM Start_end_Time WHERE IdEmployee = @IdEmployee and IdCustomer = @IdCustomer ORDER BY IdStart DESC  ) IS NULL)
	Begin
	INSERT INTO Start_end_Time (IdCustomer,IdEmployee,ArrivingTime) OUTPUT inserted.IdStart Values(@IdCustomer, @IdEmployee, GETDATE())
	end
	else
		begin
			return 0
		end

End
