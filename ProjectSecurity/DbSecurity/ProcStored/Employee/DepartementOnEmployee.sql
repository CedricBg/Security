CREATE PROCEDURE [dbo].[DepartementOnEmployee]
	@IdDepartement int,
	@IdEmployee int
AS
Begin
	INSERT INTO Belongs (IdEmployee,IdDepartement) Values(@IdEmployee, @IdDepartement)
End
