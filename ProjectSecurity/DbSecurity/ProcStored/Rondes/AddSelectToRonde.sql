CREATE PROCEDURE [dbo].[AddSelectToRonde]
	@IdEmployee int,
	@RfidNr varchar(255)
AS

	INSERT INTO AddCheckRfid (IdEmployee,RfidNr,timeCheck) Values(@IdEmployee,@RfidNr,GETDATE())
RETURN 0
