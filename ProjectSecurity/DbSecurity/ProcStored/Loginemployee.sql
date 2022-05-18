CREATE PROCEDURE [dbo].[Loginemployee]
	@Login VARCHAR(50),
	@Password VARCHAR(50)

AS
Begin
	Set NOCOUNT ON
	DECLARE @SecretKey VARCHAR(200)
	SET @SecretKey = dbo.GetSecretKey()

	DECLARE @salt VARCHAR(100)
	SET @salt = (SELECT Salt FROM Users WHERE  Login = @Login)

	DECLARE @password_hash VARBINARY(64)
	SET @password_hash = HASHBYTES('SHA2_512', CONCAT(@salt, @SecretKey, @password, @salt))

	Declare @IdUser INT
	set @IdUser = (SELECT IdUser from Users WHERE (Password_hash = @password_hash AND ([Login] = @Login)))

	
End