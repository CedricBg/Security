CREATE TABLE [dbo].[Rapport]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NameRapport] VARCHAR(50) NOT NULL, 
    [DateRapport] DATETIME2 NOT NULL, 
    [IdCustomer] INT NOT NULL, 
    [IdEmployee] INT NOT NULL,
    

)
