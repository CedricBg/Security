CREATE PROCEDURE [dbo].[StartRonde]
	@idRonde int,
	@IdEmployee int 
AS
Begin
	UPDATE Ronde Set Start = GETDATE(), IdEmployee = @IdEmployee where IdRonde = @idRonde
End
