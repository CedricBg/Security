CREATE TABLE [dbo].[SubContractors]
(
	[Idsub] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdContactPerson] INT NOT NULL, 
    [IdInformations] INT NOT NULL, 
    [IdUsers] INT NULL
)
