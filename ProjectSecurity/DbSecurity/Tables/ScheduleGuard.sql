CREATE TABLE [dbo].[ScheduleGuard]
(
	[IdSchedule] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StartTime] DATETIME2 NOT NULL, 
    [EndTime] DATETIME2 NULL,
    [IdEmployee] INT NULL, 
    [IdCustomer] INT NULL, 

)
