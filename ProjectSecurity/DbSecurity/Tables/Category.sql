CREATE TABLE [dbo].[Category]
(
	[IdCategory] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NameProduct] VARCHAR(50) NOT NULL, 
    [Width] INT NULL, 
    [Height] INT NULL, 
    [Weight] INT NULL, 
    [Confirmation] VARCHAR(255) NULL, 
    [IdSub] INT NULL,
    CONSTRAINT FK_CAT_SUB FOREIGN KEY (IdSub) REFERENCES SubContractors (Idsub)
)
