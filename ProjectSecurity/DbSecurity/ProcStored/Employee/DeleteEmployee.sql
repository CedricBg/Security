CREATE PROCEDURE [dbo].[DeleteEmployee]
	@IdEmployee int
AS
Begin
	Delete from Employee where IdEmployee = @IdEmployee
END

