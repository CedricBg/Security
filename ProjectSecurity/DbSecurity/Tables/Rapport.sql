﻿CREATE TABLE [dbo].[Rapport]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NameRapport] VARCHAR(50) NOT NULL, 
    [DateRapport] DATETIME2 NOT NULL, 
    [IdCustomer] INT NOT NULL, 
    [IdEmployee] INT NOT NULL,
    CONSTRAINT FK_RAPPORT_CUST_EMPLOYEE FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer) ,
    CONSTRAINT FK_RAPPORT_EMPLOYEE_CUST FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee) ,

)