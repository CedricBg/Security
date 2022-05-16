CREATE TABLE [dbo].[ContactPerson]
(
	[IdContactPerson] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LastName] VARCHAR(40) NOT NULL, 
    [FirstName] VARCHAR(40) NULL
)
