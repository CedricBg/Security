CREATE PROCEDURE [dbo].[CustomerById]
	@IDCustomer int
	AS
	Begin
		SELECT  
		cust.IdCustomer,
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
		S.ClasseName,
		E.[Language]

		FROM Customer cust , Informations info, Countrys C ,StatutAgent S, Employee_Language E
		Where cust.IdCustomer = @IDCustomer 
		AND info.IdInformation = cust.IdInformation 
		AND C.IdCountrys = info.IdCountry
		and E.IdLanguage = cust.IdLanguages
		and cust.IdStatuts = S.IdStatut
	End


	