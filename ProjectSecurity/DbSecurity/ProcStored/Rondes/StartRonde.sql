CREATE PROCEDURE StartRonde
	@idRonde int,
	@IdEmployee int 
AS
Begin
	INSERT INTO TimeRonde ([Start], IdRonde, IdEmployee)output inserted.Id Values(GETDATE(),@idRonde,@IdEmployee)
End
