CREATE PROCEDURE [dbo].[AddSelectToRonde]
	@IdTimeRonde int,
	@RfidNr varchar(255)
AS

	INSERT INTO AddCheckRfid (IdTimeRonde,RfidNr,timeCheck) Values(@IdTimeRonde,@RfidNr,GETDATE())
RETURN 0
