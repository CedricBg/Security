CREATE TABLE [dbo].[Product]
(
	[IdProduct] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Rfid] VARCHAR(150) NULL, 
    [IdCategory] INT NOT NULL,
    
)
