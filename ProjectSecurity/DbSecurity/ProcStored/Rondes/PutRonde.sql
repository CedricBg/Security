CREATE PROCEDURE [dbo].[PutRonde]
	@Id int,
	@NameRonde varchar(50)
AS
Begin
	Update Ronde SET NameRonde = @NameRonde Where IdCustomer = @Id
End
