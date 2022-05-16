CREATE TABLE [dbo].[Calling]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCustomers] INT NOT NULL, 
    [IdContactPerson] INT NOT NULL,
    CONSTRAINT FK_CUST_CONTACT FOREIGN KEY (IdCustomers) REFERENCES Customer (IdCustomer),
    CONSTRAINT FK_CONTACT_CUST FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson)

)
