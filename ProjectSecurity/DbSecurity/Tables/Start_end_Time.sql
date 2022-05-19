CREATE TABLE [dbo].[Start_end_Time]
(
	[IdStart] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ArrivingTime] DATETIME2 NOT NULL, 
    [DepartureTime] DATETIME2 NULL, 
    [IdEmployee] INT NOT NULL, 
    [IdCustomer] INT NULL

)
