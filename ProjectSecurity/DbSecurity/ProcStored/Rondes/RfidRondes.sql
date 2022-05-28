CREATE PROCEDURE [dbo].[RfidRondes]
	@RfidNumber varchar(255),
	@IdCustomer int,
	@Location varchar(150)
AS
	begin
		INSERT INTO RfidPatrol ([Location], IdCustomer, RfidNumber) Values(@Location, @IdCustomer, @RfidNumber)
	end
