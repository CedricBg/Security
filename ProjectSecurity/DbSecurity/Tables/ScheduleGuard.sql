CREATE TABLE [dbo].[ScheduleGuard]
(
	[IdSchedule] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StartTime] VARCHAR(50) NOT NULL, 
    [EndTime] VARCHAR(50) NOT NULL,
    [IdEmployee] INT NOT NULL, 
    [Customer] VARCHAR(50) NOT NULL, 

)
