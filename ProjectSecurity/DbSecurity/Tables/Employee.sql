CREATE TABLE [dbo].[Employee]
(
	[IdEmployee] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Name] VARCHAR(50) NOT NULL, 
    [firstName] VARCHAR(50) NOT NULL, 
    [BirthDate] VARCHAR(50) NOT NULL, 
    [Vehicle] BIT NOT NULL DEFAULT 0, 
    [SecurityCardNumber] INT NOT NULL DEFAULT 0, 
    [EntryService] VARCHAR(50) NOT NULL, 
    [RegistreNational] VARCHAR(20) NOT NULL,
    [EmployeeCardNumber] VARCHAR(255) NOT NULL DEFAULT 0 , 
    [IdLanguage] INT NOT NULL, 
    [IdInformation] INT NOT NULL DEFAULT 0, 
    [IdUsers] INT NULL  , 
    [IdStatut] INT NOT NULL
)
