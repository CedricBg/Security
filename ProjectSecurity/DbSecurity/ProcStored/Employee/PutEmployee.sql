CREATE PROCEDURE [dbo].[PutEmployee]
	@Name varchar(50),
	@firstName varchar(50),
	@BirthDate varchar(50),
	@Vehicle bit,
	@SecurityCard varchar(50),
	@EmployeeCardNumber varchar(50),
	@RegistreNational varchar(20),
	@IdLanguage int,
	@IdInformation int,
	@IdEmployee int

AS
Begin
	Update Employee Set @Name = @Name, @firstName = @firstName , BirthDate = @BirthDate, Vehicle = @Vehicle, 
	SecurityCardNumber = @SecurityCard, EmployeeCardNumber = @EmployeeCardNumber, RegistreNational = @RegistreNational,
	IdLanguage = @IdLanguage, IdInformation = @IdInformation where IdEmployee = @IdEmployee



end
