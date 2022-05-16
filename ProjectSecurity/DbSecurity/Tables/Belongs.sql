CREATE TABLE [dbo].[Belongs]
(
	[IdBelongs] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdEmployee] INT NOT NULL, 
    [IdDepartement] INT NOT NULL,
    CONSTRAINT FK_BEL_EMPLO1 FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee),
    CONSTRAINT FK_BEL_DEPART1 FOREIGN KEY (IdDepartement) REFERENCES Departement (IdDepartement)

)
