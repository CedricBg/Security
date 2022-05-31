CREATE PROCEDURE [dbo].[EndRonde]
	@IdTime int
AS
begin
	UPDATE TimeRonde Set [End] = GETDATE() where Id = @IdTime
end
