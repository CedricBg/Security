CREATE TABLE [dbo].[AddCheckRfid]
(
	[IdCheck] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RfidNr] VARCHAR(255) NOT NULL, 
    [timeCheck] DATETIME2 NOT NULL, 
    [IdEmployee] INT NOT NULL
    
)
