CREATE PROCEDURE [dbo].[AllCountrys]
	
AS
begin
	SELECT * from Countrys ORDER BY Country ASC;
end
