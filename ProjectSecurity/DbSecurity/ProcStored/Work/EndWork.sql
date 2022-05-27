CREATE PROCEDURE [dbo].[EndWork]
	@IdStart int
AS
BEGIN
	Declare @Arrive Date
	Declare @Depart Date

	SET @Arrive  = (SELECT TOP 1 ArrivingTime FROM Start_end_Time WHERE IdStart = @IdStart  ORDER BY IdStart DESC )
	SET @Depart  = (SELECT TOP 1 DepartureTime FROM Start_end_Time WHERE IdStart = @IdStart  ORDER BY IdStart DESC )

	if (@Arrive IS not NULL 
	And @Depart IS NULL)
	begin
		UPDATE Start_end_Time SET DepartureTime = GETDATE() where IdStart = @IdStart
	end
END
