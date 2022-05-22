CREATE PROCEDURE [dbo].[PutCustomer]
	@Name varchar(50),
	@GeneralPhone varchar(50),
	@EmergencyPhone varchar(50),
	@EmergencyEmail varchar(50),
	@Street varchar(50),
	@PostCode varchar(30),
	@StreetNumber varchar(20),
	@IdCountry int,
	@Phone varchar(50),
	@Email varchar(50),
	@IdInformation int,
	@IdCustomer int
AS
Begin
	Update Customer Set [Name] = @Name , GeneralPhone = @GeneralPhone, EmergencyEmail = @EmergencyEmail, EmergencyPhone = @EmergencyPhone, @IdCountry = @IdCountry
	Where IdCustomer = @IdCustomer

	Update Informations Set Street = @Street, PostCode = @PostCode, StreetNumber = @StreetNumber, Phone = @Phone ,Email = @Email , IdCountry = @IdCountry 
	Where IdInformation = @IdInformation
End
	

