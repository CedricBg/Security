CREATE PROCEDURE [dbo].[GetOneEmployee]
	@Id int 
AS
BEGIN
	SELECT * from Employee Where IdEmployee=@Id 
END
