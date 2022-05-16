﻿CREATE TABLE [dbo].[Users]
(
	[IdUser] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Login] NCHAR(10) NOT NULL,
	[Salt] VARCHAR(100) NOT NULL, 
    [Password_hash] VARBINARY(64) NOT NULL, 
    CONSTRAINT UK_LOGIN UNIQUE (Login)

)
