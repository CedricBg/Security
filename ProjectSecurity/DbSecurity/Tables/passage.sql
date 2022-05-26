CREATE TABLE [dbo].[passage]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdRfid] INT NOT NULL, 
    [location] VARCHAR(100) NOT NULL, 
    [OrdreDePassage] INT NOT NULL
    
)
