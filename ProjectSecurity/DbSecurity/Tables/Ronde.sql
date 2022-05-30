CREATE TABLE [dbo].[Ronde]
(
	[IdRonde] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCustomer] INT NOT NULL, 
    [NameRonde] VARCHAR(50) NOT NULL, 
    [Start] DATE NULL, 
    [End] DATE NULL, 
    [IdEmployee] INT NULL
    
)
