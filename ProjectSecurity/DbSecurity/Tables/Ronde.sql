CREATE TABLE [dbo].[Ronde]
(
	[IdRonde] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCustomer] INT NOT NULL, 
    [NameRonde] VARCHAR(50) NOT NULL 
)
