﻿CREATE TABLE [dbo].[Customer]
(
	[IdCustomer] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [GeneralPhone] VARCHAR(50) NULL, 
    [EmergencyPhone] VARCHAR(50) NULL, 
    [EmergencyEmail] VARCHAR(50) NULL, 
    [IdAdress] INT NOT NULL, 
    [IdUsers] INT NULL,

)