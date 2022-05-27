CREATE TABLE [dbo].[Customer]
(
	[IdCustomer] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [GeneralPhone] VARCHAR(50) NULL, 
    [EmergencyPhone] VARCHAR(50) NULL, 
    [EmergencyEmail] VARCHAR(50) NULL, 
    [IdInformation] INT NOT NULL, 
    [IdUsers] INT NULL, 
    [Active] BIT NOT NULL DEFAULT 1, 
    [IdLanguages] INT NOT NULL, 
    [IdStatuts] INT NULL
)
