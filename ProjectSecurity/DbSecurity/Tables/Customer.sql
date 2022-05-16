CREATE TABLE [dbo].[Customer]
(
	[IdCustomer] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [GeneralPhone] VARCHAR(50) NULL, 
    [EmergencyPhone] VARCHAR(50) NULL, 
    [EmergencyEmail] VARCHAR(50) NULL, 
    [IdInformation] INT NOT NULL, 
    [IdUsers] INT NULL,
    CONSTRAINT FK_CUST_INFOR FOREIGN KEY (IdInformation) REFERENCES Informations (IdInformation),
    CONSTRAINT FK_CUST_USERS FOREIGN KEY (IdUsers) REFERENCES Users (IdUser)

)
