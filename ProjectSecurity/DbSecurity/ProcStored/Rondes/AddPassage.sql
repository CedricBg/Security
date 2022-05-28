CREATE PROCEDURE [dbo].[AddPassage]
	@IdRfid int,
	@IdRonde int
AS
Begin
	INSERT INTO  passage (IdRfid, IdRondes) Values(@IdRfid, @IdRonde)
end
