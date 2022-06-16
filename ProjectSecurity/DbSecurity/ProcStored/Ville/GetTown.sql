CREATE PROCEDURE [dbo].[GetTown]
AS
Begin
	SELECT fieldscolumn_2 , fieldscolumn_1 from mytable ORDER BY fieldscolumn_2 ASC;
end
