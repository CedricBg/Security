CREATE TABLE [dbo].[passage]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdRfid] VARCHAR(255) NOT NULL, 
    [location] VARCHAR(100) NOT NULL,
    CONSTRAINT FK_PASSA_RFID foreign key (IdRfid) REFERENCES RfidPatrol(IdRfid)
)
