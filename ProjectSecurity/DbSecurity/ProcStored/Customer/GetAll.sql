CREATE PROCEDURE [dbo].[GetAll]

AS
begin
	SELECT cust.IdCustomer,
	cust.[Name], 
	cust.EmergencyEmail,
	cust.EmergencyPhone,
	cust.GeneralPhone,
	info.Email,
	info.Phone,
	info.PostCode,
	info.Street,
	info.StreetNumber,
	E.[Language],
	c.Country,
	S.ClasseName
		FROM Customer cust , Informations info, Countrys C , Employee_Language E,StatutAgent S
		Where info.IdInformation = cust.IdInformation 
		AND C.IdCountrys = info.IdCountry
		and cust.IdLanguages = E.IdLanguage
		and S.IdStatut = cust.IdStatuts
		and cust.Active = 'True'
End
