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
    @IdInformation int,
    @IdDepartment int

As

Begin
Set NOCOUNT ON
   DECLARE @IDemployee TABLE
   (
    Id INT
   ) ;
   Declare @variable int
    Insert into Employee ([Name], firstName, BirthDate, Vehicle, SecurityCardNumber, RegistreNational,EntryService, EmployeeCardNumber,IdStatut, IdLanguage,IdInformation)
    output inserted.IdEmployee into @IDemployee(Id)
    Values(@Name, @FirstName, @BirthDate, @Vehicle, @SecurityCard, @RegistreNational, @EntryService, @EmployeeCardNumber, @IdStatut, @IdLanguage, @IdInformation)
    INSERT INTO Manage (IdDepartement,IdEmployee) Values(@IdDepartment, (Select T.Id from @IDemployee As T))
End
