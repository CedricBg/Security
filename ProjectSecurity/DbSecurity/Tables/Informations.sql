CREATE TABLE [dbo].[SubContractors]
(
	[IdInformation] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Street] VARBINARY(40) NULL, 
    [PastCode] VARCHAR(30) NULL, 
    [StreetNumber] VARCHAR(20) NULL, 
    [IdCountry] NCHAR(10) NULL, 
    [Phone] VARCHAR(50) NOT NULL, 
    [Email] VARCHAR(50) NULL,
    CONSTRAINT FK_COUNTRY_INFO FOREIGN KEY (IdCountry) REFERENCES Countrys (IdCountrys)
)
