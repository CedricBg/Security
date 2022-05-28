CREATE PROCEDURE [dbo].[GatAllEmployee]
AS
	SELECT
	I.Email,
	I.Phone,
	I.PostCode,
	I.Street,
	I.StreetNumber,
	E.BirthDate,
	E.EmployeeCardNumber,
	E.EntryService,
	E.firstName,
	E.IdEmployee,
	E.[Name],
	E.RegistreNational,
	E.SecurityCardNumber,
	E.Vehicle,
	C.Country,
	S.ClasseName,
	L.[Language],
	D.NameDepartement
	
	from Employee E,Countrys C, Informations I ,StatutAgent S, Employee_Language L, Departement D, Belongs B
	where I.IdInformation = E.IdInformation
	and C.IdCountrys = I.IdCountry
	and S.IdStatut = E.IdStatut
	and L.IdLanguage = E.IdLanguage
	and B.IdEmployee = E.IdEmployee
	and D.IdDepartement = b.IdDepartement
RETURN 0
