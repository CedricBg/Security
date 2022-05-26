CREATE PROCEDURE [dbo].[CustomerById]
	@IDCustomer int
	AS
	Begin
		SELECT *
		FROM Customer cust , Informations info, Countrys C 
		Where cust.IdCustomer = @IDCustomer 
		AND info.IdInformation = cust.IdInformation 
		AND C.IdCountrys = info.IdCountry
	End


	