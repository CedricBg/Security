CREATE PROCEDURE [dbo].[AddCustomer]
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
	@IdLanguage int,
	@Role int


AS
Begin
Set NOCOUNT ON
	
	Declare @IdInfo TABLE
	(
	Id int
	);
	DECLARE @Information int
	
	Insert Into Informations (Street,StreetNumber,PostCode,IdCountry, Phone,Email)
	Output inserted.IdInformation INTO @IdInfo
	values(@Street, @StreetNumber,@PostCode,@IdCountry,@Phone,@Email)
	Declare @info int 
	Set @info = (Select Id from @IdInfo)

	Insert into Customer ([Name], GeneralPhone, EmergencyPhone,EmergencyEmail,IdInformation, IdLanguages, IdStatuts) 
	values(@Name, @GeneralPhone, @EmergencyPhone,@EmergencyEmail,@info, @IdLanguage, @Role) 

	
End
