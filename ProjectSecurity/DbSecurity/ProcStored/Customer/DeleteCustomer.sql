CREATE PROCEDURE [dbo].[DeleteCustomer]
	@IdCustomer int
AS
Begin
	Delete from Customer where IdCustomer = @IdCustomer
END
