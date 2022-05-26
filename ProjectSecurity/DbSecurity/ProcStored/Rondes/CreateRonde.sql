CREATE PROCEDURE [dbo].[CreateRonde]
	@NameRonde varchar(50),
	@IdCustomer int
AS
	Insert into Ronde (NameRonde, IdCustomer) Values (@NameRonde, @IdCustomer)
RETURN 0
