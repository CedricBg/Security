CREATE PROCEDURE [dbo].[AddEmployee]
    @Name varchar(50),
    @FirstName varchar(50),
    @BirthDate varchar(50),
    @Vehicle bit,
    @SecurityCard int  ,
    @EntryService varchar(50) , 
    @EmployeeCardNumber varchar(50) ,
    @RegistreNational varchar(50) ,
    @IdStatut int  ,
    @IdLanguage int ,
    @IdInformation int
As
Begin
    Insert into Employee ([Name], firstName, BirthDate, Vehicle, SecurityCardNumber, RegistreNational,EntryService, EmployeeCardNumber,IdStatut, IdLanguage,IdInformation)
    output inserted.IdEmployee
    Values(@Name, @FirstName, @BirthDate, @Vehicle, @SecurityCard, @RegistreNational, @EntryService, @EmployeeCardNumber, @IdStatut, @IdLanguage, @IdInformation)
End
