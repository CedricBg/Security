CREATE PROCEDURE [dbo].[PutEmployee]
	@Name varchar(50),
	@firstName varchar(50),
	@BirthDate varchar(50),
	@Vehicle bit,
	@SecurityCard int,
	@EmployeeCardNumber varchar(50),
	@RegistreNational varchar(20),
	@Language varchar(50),
	@IdEmployee int,
	@Departement varchar(50),
	@street varchar(50),
	@Phone varchar(50),
	@Email varchar(50),
	@PostCode varchar(30),
	@StreetNumber varchar(20),
	@Country varchar(50),
	@Role varchar(50)

AS
Begin
	Update Employee Set [Name] = @Name, firstName = @firstName , BirthDate = @BirthDate, Vehicle = @Vehicle, 
	SecurityCardNumber = @SecurityCard, EmployeeCardNumber = @EmployeeCardNumber, RegistreNational = @RegistreNational,
	IdLanguage = (Select IdLanguage from Employee_Language where [Language] = @Language ), IdStatut = (SELECT IdStatut from StatutAgent where ClasseName = @Role) where IdEmployee = @IdEmployee
	Update Informations Set Street = @Street, PostCode = @PostCode, StreetNumber = @StreetNumber, Phone = @Phone ,Email = @Email , IdCountry = (select IdCountrys from Countrys where Country = @Country)
	where IdInformation =  (Select IdInformation from Employee where IdEmployee = @IdEmployee)
	Update Manage Set IdDepartement = (select IdDepartement from Employee where IdEmployee = @IdEmployee) 
end
