CREATE TABLE [dbo].[RfidPatrol]
(
	[IDRfid] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Location] VARCHAR(150) NOT NULL, 
    [IdCustomer] INT NOT NULL, 
    [RfidNumber] VARCHAR(255) NOT NULL, 
)
