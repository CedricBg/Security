CREATE TABLE [dbo].[TimeRonde]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Start] DATETIME NOT NULL, 
    [End] DATETIME NULL, 
    [IdRonde] INT NOT NULL, 
    [IdEmployee] INT NOT NULL
)
