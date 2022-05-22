CREATE TRIGGER [dbo].[DeleteCustomers]
ON Customer
INSTEAD OF DELETE
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Customer SET Active = 0 WHERE IdCustomer = (SELECT IdCustomer FROM deleted)

END
