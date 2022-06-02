CREATE TABLE [dbo].[ScheduleGuard]
(
	[IdSchedule] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StartTime] DATETIME NOT NULL, 
    [EndTime] DATETIME NOT NULL,
    [IdEmployee] INT NOT NULL, 
    [IdCustomer] INT NOT NULL, 

)
