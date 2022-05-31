CREATE TABLE [dbo].[AddCheckRfid]
(
	[IdCheck] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RfidNr] VARCHAR(255) NOT NULL, 
    [timeCheck] DATETIME NOT NULL, 
    [IdTimeRonde] INT NOT NULL
    
)
