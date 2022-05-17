CREATE TABLE [dbo].[SubContractors]
(
	[Idsub] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdContactPerson] INT NOT NULL, 
    [IdInformations] INT NOT NULL, 
    [IdUsers] INT NULL,
    CONSTRAINT FK_INFO_PERSO FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson),
    CONSTRAINT FK_INFO_SUB FOREIGN KEY (IdInformations) REFERENCES Informations (IdInformation),
    CONSTRAINT FK_SUB_USERS FOREIGN KEY (IdUsers) REFERENCES Users (IdUser)

)
