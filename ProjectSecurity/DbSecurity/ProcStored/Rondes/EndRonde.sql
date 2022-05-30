CREATE PROCEDURE [dbo].[EndRonde]
	@IdRonde int
AS
begin
	UPDATE Ronde SET [End] = GETDATE() where IdRonde = @IdRonde
end
