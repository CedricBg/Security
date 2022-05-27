CREATE PROCEDURE [dbo].[EndWork]
	@IdStart int
AS
BEGIN
	UPDATE Start_end_Time SET DepartureTime = GETDATE() where IdStart = @IdStart
END
