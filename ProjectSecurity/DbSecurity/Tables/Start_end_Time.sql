CREATE TABLE [dbo].[Start_end_Time]
(
	[IdStart] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ArrivingTime] DATETIME2 NOT NULL, 
    [DepartureTime] DATETIME2 NULL, 
    [IdEmployee] INT NOT NULL, 
    [IdCustomer] INT NULL,
    CONSTRAINT FK_START_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee),
    CONSTRAINT FK_START_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)

)
