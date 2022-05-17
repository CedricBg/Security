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
    [EmployeeCardNumber] VARCHAR(255) NOT NULL DEFAULT 0, 
    [IdLanguage] INT NOT NULL, 
    [IdInformation] INT NULL, 
    [IdUsers] INT NULL, 
    [IdStatut] INT NOT NULL, 
    CONSTRAINT FK_STATUT_EMPLOYEE FOREIGN KEY ([IdStatut]) REFERENCES StatutAgent (IdStatut),
    CONSTRAINT FK_LANG_EMPLO FOREIGN KEY (IdLanguage) REFERENCES Employee_Language (IdLanguage),
    CONSTRAINT FK_INFORMATION_EMPLO FOREIGN KEY (IdInformation) REFERENCES Informations (IdInformation),
    CONSTRAINT FK_USERS_EMPLOYEE FOREIGN KEY (IdUsers) REFERENCES Users (IdUser),
    CONSTRAINT FK_EMPLO_STATU FOREIGN KEY (IdStatut) REFERENCES StatutAgent (IdStatut)
)
