CREATE TABLE [dbo].[Informations]
(
	[IdInformation] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Street] VARBINARY(40) NULL, 
    [PostCode] VARCHAR(30) NULL, 
    [StreetNumber] VARCHAR(20) NULL, 
    [IdCountry] INT NULL, 
    [Phone] VARCHAR(50) NOT NULL, 
    [Email] VARCHAR(50) NULL,
    CONSTRAINT FK_COUNTRY_INFO FOREIGN KEY (IdCountry) REFERENCES Countrys (IdCountrys)
)
