CREATE TRIGGER [dbo].[DeleteEmployees]
ON Employee
INSTEAD OF DELETE
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Employee SET Active = 0 WHERE IdEmployee = (SELECT IdEmployee FROM deleted)

END
