CREATE TABLE [dbo].[SubContractors]
(
	[Idsub] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdContactPerson] INT NOT NULL, 
    [IdInformations] INT NOT NULL, 
    [idUsers] INT NULL,
    CONSTRAINT FK_INFO_SUB FOREIGN KEY (IdInformations) REFERENCES Informations (IdInformation)

)
