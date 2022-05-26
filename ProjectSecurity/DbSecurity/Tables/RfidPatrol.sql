CREATE TABLE [dbo].[RfidPatrol]
(
	[IDRfid] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Location] VARCHAR(50) NOT NULL, 
    [IdCustomer] INT NOT NULL, 
    [Rfid] VARCHAR(255) NOT NULL, 
)
