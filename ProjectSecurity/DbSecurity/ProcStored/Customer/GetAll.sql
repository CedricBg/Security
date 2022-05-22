CREATE PROCEDURE [dbo].[GetAll]

AS
begin
	SELECT *
		FROM Customer cust , Informations info, Countrys C 
		Where info.IdInformation = cust.IdInformation 
		AND C.IdCountrys = info.IdCountry
End
