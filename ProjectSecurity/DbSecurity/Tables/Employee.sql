CREATE TABLE [dbo].[Employee]
(
	[IdEmployee] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Name] VARCHAR(50) NOT NULL, 
    [firstName] VARCHAR(50) NOT NULL, 
    [BirthDate] VARCHAR(50) NOT NULL, 
    [Vehicle] BIT NOT NULL DEFAULT 0, 
    [SecurityCardNumber] BIGINT NOT NULL DEFAULT 0, 
    [EntryService] DATETIME2 NOT NULL, 
    [RegistreNational] VARCHAR(20) NOT NULL, 
    [IdGrade] INT NOT NULL, 
    [IdLanguage] INT NOT NULL, 
    [IdInformation] INT NOT NULL, 
    [IdUsers] INT NULL, 
    [EmployeeCardNumber] INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_GRADE_EMPLO FOREIGN KEY (IdGrade) REFERENCES Grade (IdGrade),
    CONSTRAINT FK_LANG_EMPLO FOREIGN KEY (IdLanguage) REFERENCES Languages (IdLanguage),
    CONSTRAINT FK_INFORMATION_EMPLO FOREIGN KEY (IdInformation) REFERENCES Informations (IdInformation),
    CONSTRAINT FK_USERS_EMPLO FOREIGN KEY (IdUsers) REFERENCES Users (IdUser)
    
)
