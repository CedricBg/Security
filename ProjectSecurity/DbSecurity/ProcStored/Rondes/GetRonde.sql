CREATE PROCEDURE [dbo].[GetRonde]
	@IdCustomer int
AS
Begin
SELECT d.NameRonde, rf.[Location]
from (Ronde d join passage P
on P.IdRondes = d.IdRonde)
join RfidPatrol rf
on rf.IDRfid = P.IdRfid
and d.IdCustomer = @IdCustomer
End
