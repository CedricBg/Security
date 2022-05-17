CREATE TABLE [dbo].[RackProduct]
(
	[IdRack] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RowNumber] VARCHAR(30) NULL, 
    [RackNumber] VARCHAR(30) NULL, 
    [HeightNumber] VARCHAR(30) NULL, 
    [Rfid] VARCHAR(50) NULL
)
