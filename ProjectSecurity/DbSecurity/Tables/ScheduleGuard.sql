CREATE TABLE [dbo].[ScheduleGuard]
(
	[IdSchedule] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StartTime] DATETIME2 NOT NULL, 
    [EndTime] DATETIME2 NULL,
    [IdEmployee] INT NULL, 
    [IdCustomer] INT NULL, 
    CONSTRAINT FK_SCHEDU_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee),
    CONSTRAINT FK_SCHEDU_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)
)
