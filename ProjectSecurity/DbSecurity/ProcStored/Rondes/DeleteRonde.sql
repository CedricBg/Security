CREATE PROCEDURE [dbo].[DeleteRonde]
	@IdRonde int
AS
Begin
	Delete from Ronde Where IdRonde = @IdRonde
End
