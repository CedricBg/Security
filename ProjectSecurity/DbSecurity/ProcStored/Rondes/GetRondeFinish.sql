CREATE PROCEDURE [dbo].[GetRondeFinish]
	@Id int
AS
begin
SELECT DISTINCT T.[Start], t.[End],timeCheck, RF.Location,
(SELECT Name FROM Customer where IdCustomer = 1) as Client,
(Select Name from Employee where IdEmployee = T.IdEmployee) as Agent
FROM TimeRonde T, AddCheckRfid A,Ronde R,Employee E, RfidPatrol RF
WHERE T.Id = A.IdTimeRonde
and R.IdRonde = T.IdRonde
and RF.RfidNumber = A.RfidNr
and R.IdCustomer = 1
end
