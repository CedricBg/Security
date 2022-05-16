CREATE TABLE [dbo].[Manage]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,    
    [IdEmployee] INT NOT NULL, 
    [IdDepartement] INT NOT NULL,
    CONSTRAINT FK_BEL_EMPLO2 FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee),
    CONSTRAINT FK_BEL_DEPART2 FOREIGN KEY (IdDepartement) REFERENCES Departement (IdDepartement)
)
