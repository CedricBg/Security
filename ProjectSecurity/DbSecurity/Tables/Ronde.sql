CREATE TABLE [dbo].[Ronde]
(
	[IdRonde] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCustomer] INT NOT NULL, 
    [NameRonde] VARCHAR(50) NOT NULL
)
