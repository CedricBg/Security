CREATE PROCEDURE [dbo].[Register]
	@Login VARCHAR(50),
	@Password VARCHAR(50),
	@Name VARCHAR(50)

As
Begin
Set NOCOUNT ON
	DECLARE @SecretKey VARCHAR(200)
	SET @SecretKey  = dbo.GetSecretKey()

	Declare @Salt VARBINARY(100)
	SET @Salt = CONCAT(NEWID(), NEWID(), NEWID())

	DECLARE @password_hash VARBINARY(64)
	SET @password_hash = HASHBYTES('SHA2_512', CONCAT(@Salt,@SecretKey,@Password, @Salt))

	DECLARE @Id INT
	INSERT INTO Users (Salt,Password_hash,[Login])
	OUTPUT inserted.IdUser INTO @Id
	Values(@Salt, @password_hash,@Login)

	UPDATE Employee SET Name = @Name where IdEmployee = @Id

End
