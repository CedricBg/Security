CREATE TABLE [dbo].[Contacting]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdSub] INT NULL, 
    [IdContactPerson] INT NULL,
    CONSTRAINT FK_SUB_CONTACT_SUB FOREIGN KEY (IdSub) REFERENCES SubContractors (Idsub),
    CONSTRAINT FK_SUB_CONTACT_PERSON FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson)
)
