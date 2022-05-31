﻿/*
Script de déploiement pour ProjetSecurity

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ProjetSecurity"
:setvar DefaultFilePrefix "ProjetSecurity"
:setvar DefaultDataPath "D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
Le type de la colonne timeCheck dans la table [dbo].[AddCheckRfid] est actuellement  DATETIME2 (7) NOT NULL, mais est remplacé par  DATETIME NOT NULL. Une perte de données peut se produire et le déploiement risque d'échouer si la colonne contient des données incompatibles avec le type  DATETIME NOT NULL.
*/

IF EXISTS (select top 1 1 from [dbo].[AddCheckRfid])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CHECK_EMPLO]...';


GO
ALTER TABLE [dbo].[AddCheckRfid] DROP CONSTRAINT [FK_CHECK_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CHECK_RFID]...';


GO
ALTER TABLE [dbo].[AddCheckRfid] DROP CONSTRAINT [FK_CHECK_RFID];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BEL_DEPART1]...';


GO
ALTER TABLE [dbo].[Belongs] DROP CONSTRAINT [FK_BEL_DEPART1];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BEL_EMPLO1]...';


GO
ALTER TABLE [dbo].[Belongs] DROP CONSTRAINT [FK_BEL_EMPLO1];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BELONGS_DEPARTE]...';


GO
ALTER TABLE [dbo].[Belongs] DROP CONSTRAINT [FK_BELONGS_DEPARTE];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BELONGS_EMPLO]...';


GO
ALTER TABLE [dbo].[Belongs] DROP CONSTRAINT [FK_BELONGS_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CONTACT_CUST]...';


GO
ALTER TABLE [dbo].[Calling] DROP CONSTRAINT [FK_CONTACT_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CUST_CONTACT]...';


GO
ALTER TABLE [dbo].[Calling] DROP CONSTRAINT [FK_CUST_CONTACT];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CAT_SUB]...';


GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_CAT_SUB];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SUB_CONTACT_PERSON]...';


GO
ALTER TABLE [dbo].[Contacting] DROP CONSTRAINT [FK_SUB_CONTACT_PERSON];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SUB_CONTACT_SUB]...';


GO
ALTER TABLE [dbo].[Contacting] DROP CONSTRAINT [FK_SUB_CONTACT_SUB];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CUST_INFOR]...';


GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_CUST_INFOR];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CUST_LANG]...';


GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_CUST_LANG];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CUST_STATUT]...';


GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_CUST_STATUT];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_CUST_USERS]...';


GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_CUST_USERS];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_INFORMATION_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_INFORMATION_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_LANG_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_LANG_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_STATUT_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_STATUT_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_USERS_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_USERS_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_COUNTRY_INFO]...';


GO
ALTER TABLE [dbo].[Informations] DROP CONSTRAINT [FK_COUNTRY_INFO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BEL_DEPART2]...';


GO
ALTER TABLE [dbo].[Manage] DROP CONSTRAINT [FK_BEL_DEPART2];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_BEL_EMPLO2]...';


GO
ALTER TABLE [dbo].[Manage] DROP CONSTRAINT [FK_BEL_EMPLO2];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PAIN_CAT_COL]...';


GO
ALTER TABLE [dbo].[Painting] DROP CONSTRAINT [FK_PAIN_CAT_COL];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PAIN_COL_CAT]...';


GO
ALTER TABLE [dbo].[Painting] DROP CONSTRAINT [FK_PAIN_COL_CAT];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PASSA_RFID]...';


GO
ALTER TABLE [dbo].[passage] DROP CONSTRAINT [FK_PASSA_RFID];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PASSA_RONDE]...';


GO
ALTER TABLE [dbo].[passage] DROP CONSTRAINT [FK_PASSA_RONDE];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PROD_CATEGORY]...';


GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_PROD_CATEGORY];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_RAPPORT_CUST_EMPLOYEE]...';


GO
ALTER TABLE [dbo].[Rapport] DROP CONSTRAINT [FK_RAPPORT_CUST_EMPLOYEE];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_RAPPORT_EMPLOYEE_CUST]...';


GO
ALTER TABLE [dbo].[Rapport] DROP CONSTRAINT [FK_RAPPORT_EMPLOYEE_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_PASSAGE_CUST]...';


GO
ALTER TABLE [dbo].[RfidPatrol] DROP CONSTRAINT [FK_PASSAGE_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_RONDE_CUST]...';


GO
ALTER TABLE [dbo].[Ronde] DROP CONSTRAINT [FK_RONDE_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_RONDE_EMPLO]...';


GO
ALTER TABLE [dbo].[Ronde] DROP CONSTRAINT [FK_RONDE_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SCHEDU_CUST]...';


GO
ALTER TABLE [dbo].[ScheduleGuard] DROP CONSTRAINT [FK_SCHEDU_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SCHEDU_EMPLO]...';


GO
ALTER TABLE [dbo].[ScheduleGuard] DROP CONSTRAINT [FK_SCHEDU_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SEARCH_PRODUCT]...';


GO
ALTER TABLE [dbo].[Searching] DROP CONSTRAINT [FK_SEARCH_PRODUCT];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SEARCH_RACK]...';


GO
ALTER TABLE [dbo].[Searching] DROP CONSTRAINT [FK_SEARCH_RACK];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_START_CUST]...';


GO
ALTER TABLE [dbo].[Start_end_Time] DROP CONSTRAINT [FK_START_CUST];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_START_EMPLO]...';


GO
ALTER TABLE [dbo].[Start_end_Time] DROP CONSTRAINT [FK_START_EMPLO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_INFO_PERSO]...';


GO
ALTER TABLE [dbo].[SubContractors] DROP CONSTRAINT [FK_INFO_PERSO];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_INFO_SUB]...';


GO
ALTER TABLE [dbo].[SubContractors] DROP CONSTRAINT [FK_INFO_SUB];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_SUB_USERS]...';


GO
ALTER TABLE [dbo].[SubContractors] DROP CONSTRAINT [FK_SUB_USERS];


GO
PRINT N'Suppression de Contrainte unique [dbo].[UK_RFID_CHECK]...';


GO
ALTER TABLE [dbo].[AddCheckRfid] DROP CONSTRAINT [UK_RFID_CHECK];


GO
PRINT N'Suppression de Contrainte unique [dbo].[UK_DEPARTMENT_NAME]...';


GO
ALTER TABLE [dbo].[Departement] DROP CONSTRAINT [UK_DEPARTMENT_NAME];


GO
PRINT N'Suppression de Contrainte unique [dbo].[UK_RFID_PATROL]...';


GO
ALTER TABLE [dbo].[RfidPatrol] DROP CONSTRAINT [UK_RFID_PATROL];


GO
PRINT N'Suppression de Contrainte unique [dbo].[UK_NAME_RONDE]...';


GO
ALTER TABLE [dbo].[Ronde] DROP CONSTRAINT [UK_NAME_RONDE];


GO
PRINT N'Suppression de Contrainte unique [dbo].[UK_LOGIN_USERS]...';


GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UK_LOGIN_USERS];


GO
PRINT N'Modification de Table [dbo].[AddCheckRfid]...';


GO
ALTER TABLE [dbo].[AddCheckRfid] ALTER COLUMN [timeCheck] DATETIME NOT NULL;


GO
PRINT N'Actualisation de Procédure [dbo].[AddSelectToRonde]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[AddSelectToRonde]';


GO
PRINT N'Actualisation de Procédure [dbo].[GetRondeFinish]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[GetRondeFinish]';


GO
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


ALTER TABLE Ronde ADD CONSTRAINT UK_NAME_RONDE UNIQUE (NameRonde,IdCustomer)

ALTER TABLE Belongs ADD CONSTRAINT FK_BEL_EMPLO1 FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)
ALTER TABLE Belongs ADD CONSTRAINT FK_BEL_DEPART1 FOREIGN KEY (IdDepartement) REFERENCES Departement (IdDepartement)

ALTER TABLE Calling ADD CONSTRAINT FK_CUST_CONTACT FOREIGN KEY (IdCustomers) REFERENCES Customer (IdCustomer)
ALTER TABLE Calling ADD CONSTRAINT FK_CONTACT_CUST FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson)

ALTER TABLE Category ADD CONSTRAINT FK_CAT_SUB FOREIGN KEY (IdSub) REFERENCES SubContractors (Idsub)

ALTER TABLE Contacting ADD CONSTRAINT FK_SUB_CONTACT_SUB FOREIGN KEY (IdSub) REFERENCES SubContractors (Idsub)
ALTER TABLE Contacting ADD CONSTRAINT FK_SUB_CONTACT_PERSON FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson)

ALTER TABLE Customer ADD CONSTRAINT FK_CUST_INFOR FOREIGN KEY (IdInformation) REFERENCES Informations (IdInformation)
ALTER TABLE Customer ADD CONSTRAINT FK_CUST_USERS FOREIGN KEY (IdUsers) REFERENCES Users (IdUser)
ALTER TABLE Customer ADD CONSTRAINT FK_CUST_STATUT FOREIGN KEY (IdStatuts) REFERENCES StatutAgent (IdStatut)
ALTER TABLE Customer ADD CONSTRAINT FK_CUST_LANG FOREIGN KEY (IdLanguages) REFERENCES Employee_Language (IdLanguage)

ALTER TABLE Informations ADD CONSTRAINT FK_COUNTRY_INFO FOREIGN KEY (IdCountry) REFERENCES Countrys (IdCountrys)

ALTER TABLE Manage ADD CONSTRAINT FK_BEL_EMPLO2 FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)
ALTER TABLE Manage ADD CONSTRAINT FK_BEL_DEPART2 FOREIGN KEY (IdDepartement) REFERENCES Departement (IdDepartement)

ALTER TABLE Painting ADD CONSTRAINT FK_PAIN_CAT_COL FOREIGN KEY (IdCategory) REFERENCES Category (IdCategory)
ALTER TABLE Painting ADD CONSTRAINT FK_PAIN_COL_CAT FOREIGN KEY (IdColor) REFERENCES Color (IdColor)

ALTER TABLE passage ADD CONSTRAINT FK_PASSA_RFID foreign key (IdRfid) REFERENCES RfidPatrol(IDRfid)
ALTER TABLE passage ADD CONSTRAINT FK_PASSA_RONDE foreign key (IdRondes) REFERENCES Ronde(IdRonde)

ALTER TABLE Product ADD CONSTRAINT FK_PROD_CATEGORY FOREIGN KEY (IdCategory) REFERENCES  Category(IdCategory)

ALTER TABLE Rapport ADD CONSTRAINT FK_RAPPORT_CUST_EMPLOYEE FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)
ALTER TABLE Rapport ADD CONSTRAINT FK_RAPPORT_EMPLOYEE_CUST FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)

ALTER TABLE Ronde ADD CONSTRAINT FK_RONDE_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)
ALTER TABLE Ronde ADD CONSTRAINT FK_RONDE_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee(IdEmployee)
Alter Table RfidPatrol ADD CONSTRAINT FK_PASSAGE_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer) 
ALTER TABLE RfidPatrol ADD constraint UK_RFID_PATROL UNIQUE (RfidNumber)

Alter TABLE employee ADD CONSTRAINT FK_USERS_EMPLO FOREIGN KEY (IdUsers) REFERENCES Users (IdUser)
Alter TABLE employee ADD CONSTRAINT FK_INFORMATION_EMPLO FOREIGN KEY (IdInformation) REFERENCES Informations (IdInformation)
Alter TABLE employee ADD CONSTRAINT FK_LANG_EMPLO FOREIGN KEY (IdLanguage) REFERENCES Employee_Language (IdLanguage)
Alter TABLE employee ADD CONSTRAINT FK_STATUT_EMPLO FOREIGN KEY ([IdStatut]) REFERENCES StatutAgent (IdStatut) 

ALTER TABLE Users ADD CONSTRAINT UK_LOGIN_USERS UNIQUE (Login)

ALTER TABLE SubContractors ADD CONSTRAINT FK_INFO_PERSO FOREIGN KEY (IdContactPerson) REFERENCES ContactPerson (IdContactPerson)ON DELETE CASCADE
ALTER TABLE SubContractors ADD CONSTRAINT FK_INFO_SUB FOREIGN KEY (IdInformations) REFERENCES Informations (IdInformation)ON DELETE CASCADE
ALTER TABLE SubContractorS ADD CONSTRAINT FK_SUB_USERS FOREIGN KEY (IdUsers) REFERENCES Users (IdUser) ON DELETE CASCADE

ALTER TABLE Start_end_Time ADD CONSTRAINT FK_START_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)
ALTER TABLE Start_end_Time ADD CONSTRAINT FK_START_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)

ALTER TABLE Searching ADD CONSTRAINT FK_SEARCH_RACK FOREIGN KEY (IdRack) REFERENCES RackProduct (IdRack)
ALTER TABLE Searching ADD CONSTRAINT FK_SEARCH_PRODUCT FOREIGN KEY (IdProduct) REFERENCES Product (IdProduct)

ALTER TABLE ScheduleGuard ADD CONSTRAINT FK_SCHEDU_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)
ALTER TABLE ScheduleGuard ADD CONSTRAINT FK_SCHEDU_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)

ALTER TABLE Departement ADD CONSTRAINT UK_DEPARTMENT_NAME UNIQUE (NameDepartement)

ALTER TABLE Belongs ADD CONSTRAINT FK_BELONGS_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee(IdEmployee)
ALTER TABLE Belongs ADD CONSTRAINT FK_BELONGS_DEPARTE FOREIGN KEY (IdDepartement) REFERENCES Departement(IdDepartement)

ALTER TABLE AddCheckRfid ADD CONSTRAINT FK_CHECK_EMPLO FOREIGN KEY (IdEmployee) REFERENCES Employee(IdEmployee)
ALTER TABLE AddCheckRfid ADD CONSTRAINT FK_CHECK_RFID FOREIGN KEY (RfidNr) REFERENCES RfidPatrol(RfidNumber)
ALTER TABLE AddCheckRfid ADD constraint UK_RFID_CHECK UNIQUE (RfidNr)

INSERT INTO StatutAgent (Classe, ClasseName) Values('SB'    , 'Agent statique' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SQ'    , 'Agent statique qualifié' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SE'    , 'Agent statique expert' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SEL'   , 'Agent statique expert langues' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SBG'   , 'Agent statique bodyguard' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('MB'    , 'Agent statique base militaire' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SMBP'  , 'Portier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('MBB'   , 'Brigadier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('M1'    , 'Agent mobile patrouille' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('M2'    , 'Agent mobile IAA et chauffeur VIP' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('TR'    , 'Transporteur de fonds/agent ATM' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('PRVA'  , 'Collaborateur vault /processing' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('BI'    , 'Brigadier/instructeur' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('TM'    , 'Transport de munitions' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('G'     , 'Homme de métier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('DIR'   , 'Direction' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('OP'    , 'Opérations' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('ADM'   , 'Administratif' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('AGENT' , 'Accès minimum' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SUB'   , 'Sous-traitant' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('CUST'  , 'Client' )

INSERT INTO Countrys Values('Afghanistan')
INSERT INTO Countrys Values('Albania')
INSERT INTO Countrys Values('Algeria')
INSERT INTO Countrys Values('Andorra')
INSERT INTO Countrys Values('Angola')
INSERT INTO Countrys Values('Antigua and Barbuda')
INSERT INTO Countrys Values('Argentina')
INSERT INTO Countrys Values('Armenia')
INSERT INTO Countrys Values('Australia')
INSERT INTO Countrys Values('Austria')
INSERT INTO Countrys Values('Azerbaijan')
INSERT INTO Countrys Values('Bahamas')
INSERT INTO Countrys Values('Bahrain')
INSERT INTO Countrys Values('Bangladesh')
INSERT INTO Countrys Values('Barbados')
INSERT INTO Countrys Values('Belarus')
INSERT INTO Countrys Values('Belgium')
INSERT INTO Countrys Values('Belize')
INSERT INTO Countrys Values('Benin')
INSERT INTO Countrys Values('Bhutan')
INSERT INTO Countrys Values('Bolivia')
INSERT INTO Countrys Values('Bosnia and Herzegovina')
INSERT INTO Countrys Values('Botswana')
INSERT INTO Countrys Values('Brazil')
INSERT INTO Countrys Values('Brunei')
INSERT INTO Countrys Values('Bulgaria')
INSERT INTO Countrys Values('Burkina Faso')
INSERT INTO Countrys Values('Burundi')
INSERT INTO Countrys Values('Côte d''Ivoire')
INSERT INTO Countrys Values('Cabo Verde')
INSERT INTO Countrys Values('Cambodia')
INSERT INTO Countrys Values('Cameroon')
INSERT INTO Countrys Values('Canada')
INSERT INTO Countrys Values('Central African Republic')
INSERT INTO Countrys Values('Chad')
INSERT INTO Countrys Values('Chile')
INSERT INTO Countrys Values('China')
INSERT INTO Countrys Values('Colombia')
INSERT INTO Countrys Values('Comoros')
INSERT INTO Countrys Values('Congo Congo-Brazzaville')
INSERT INTO Countrys Values('Costa Rica')
INSERT INTO Countrys Values('Croatia')
INSERT INTO Countrys Values('Cuba')
INSERT INTO Countrys Values('Cyprus')
INSERT INTO Countrys Values('Czechia')
INSERT INTO Countrys Values('Democratic Republic of the Congo')
INSERT INTO Countrys Values('Denmark')
INSERT INTO Countrys Values('Djibouti')
INSERT INTO Countrys Values('Dominica')
INSERT INTO Countrys Values('Dominican Republic')
INSERT INTO Countrys Values('Ecuador')
INSERT INTO Countrys Values('Egypt')
INSERT INTO Countrys Values('El Salvador')
INSERT INTO Countrys Values('Equatorial Guinea')
INSERT INTO Countrys Values('Eritrea')
INSERT INTO Countrys Values('Estonia')
INSERT INTO Countrys Values('Eswatini (fmr. "Swaziland")')
INSERT INTO Countrys Values('Ethiopia')
INSERT INTO Countrys Values('Fiji')
INSERT INTO Countrys Values('Finland')
INSERT INTO Countrys Values('France')
INSERT INTO Countrys Values('Gabon')
INSERT INTO Countrys Values('Gambia')
INSERT INTO Countrys Values('Georgia')
INSERT INTO Countrys Values('Germany')
INSERT INTO Countrys Values('Ghana')
INSERT INTO Countrys Values('Greece')
INSERT INTO Countrys Values('Grenada')
INSERT INTO Countrys Values('Guatemala')
INSERT INTO Countrys Values('Guinea')
INSERT INTO Countrys Values('Guinea-Bissau')
INSERT INTO Countrys Values('Guyana')
INSERT INTO Countrys Values('Haiti')
INSERT INTO Countrys Values('Holy See')
INSERT INTO Countrys Values('Honduras')
INSERT INTO Countrys Values('Hungary')
INSERT INTO Countrys Values('Iceland')
INSERT INTO Countrys Values('India')
INSERT INTO Countrys Values('Indonesia')
INSERT INTO Countrys Values('Iran')
INSERT INTO Countrys Values('Iraq')
INSERT INTO Countrys Values('Ireland')
INSERT INTO Countrys Values('Israel')
INSERT INTO Countrys Values('Italy')
INSERT INTO Countrys Values('Jamaica')
INSERT INTO Countrys Values('Japan')
INSERT INTO Countrys Values('Jordan')
INSERT INTO Countrys Values('Kazakhstan')
INSERT INTO Countrys Values('Kenya')
INSERT INTO Countrys Values('Kiribati')
INSERT INTO Countrys Values('Kuwait')
INSERT INTO Countrys Values('Kyrgyzstan')
INSERT INTO Countrys Values('Laos')
INSERT INTO Countrys Values('Latvia')
INSERT INTO Countrys Values('Lebanon')
INSERT INTO Countrys Values('Lesotho')
INSERT INTO Countrys Values('Liberia')
INSERT INTO Countrys Values('Libya')
INSERT INTO Countrys Values('Liechtenstein')
INSERT INTO Countrys Values('Lithuania')
INSERT INTO Countrys Values('Luxembourg')
INSERT INTO Countrys Values('Madagascar')
INSERT INTO Countrys Values('Malawi')
INSERT INTO Countrys Values('Malaysia')
INSERT INTO Countrys Values('Maldives')
INSERT INTO Countrys Values('Mali')
INSERT INTO Countrys Values('Malta')
INSERT INTO Countrys Values('Marshall Islands')
INSERT INTO Countrys Values('Mauritania')
INSERT INTO Countrys Values('Mauritius')
INSERT INTO Countrys Values('Mexico')
INSERT INTO Countrys Values('Micronesia')
INSERT INTO Countrys Values('Moldova')
INSERT INTO Countrys Values('Monaco')
INSERT INTO Countrys Values('Mongolia')
INSERT INTO Countrys Values('Montenegro')
INSERT INTO Countrys Values('Morocco')
INSERT INTO Countrys Values('Mozambique')
INSERT INTO Countrys Values('Myanmar (formerly Burma)')
INSERT INTO Countrys Values('Namibia')
INSERT INTO Countrys Values('Nauru')
INSERT INTO Countrys Values('Nepal')
INSERT INTO Countrys Values('Netherlands')
INSERT INTO Countrys Values('New Zealand')
INSERT INTO Countrys Values('Nicaragua')
INSERT INTO Countrys Values('Niger')
INSERT INTO Countrys Values('Nigeria')
INSERT INTO Countrys Values('North Korea')
INSERT INTO Countrys Values('North Macedonia')
INSERT INTO Countrys Values('Norway')
INSERT INTO Countrys Values('Oman')
INSERT INTO Countrys Values('Pakistan')
INSERT INTO Countrys Values('Palau')
INSERT INTO Countrys Values('Palestine State')
INSERT INTO Countrys Values('Panama')
INSERT INTO Countrys Values('Papua New Guinea')
INSERT INTO Countrys Values('Paraguay')
INSERT INTO Countrys Values('Peru')
INSERT INTO Countrys Values('Philippines')
INSERT INTO Countrys Values('Poland')
INSERT INTO Countrys Values('Portugal')
INSERT INTO Countrys Values('Qatar')
INSERT INTO Countrys Values('Romania')
INSERT INTO Countrys Values('Russia')
INSERT INTO Countrys Values('Rwanda')
INSERT INTO Countrys Values('Saint Kitts and Nevis')
INSERT INTO Countrys Values('Saint Lucia')
INSERT INTO Countrys Values('Saint Vincent and the Grenadines')
INSERT INTO Countrys Values('Samoa')
INSERT INTO Countrys Values('San Marino')
INSERT INTO Countrys Values('Sao Tome and Principe')
INSERT INTO Countrys Values('Saudi Arabia')
INSERT INTO Countrys Values('Senegal')
INSERT INTO Countrys Values('Serbia')
INSERT INTO Countrys Values('Seychelles')
INSERT INTO Countrys Values('Sierra Leone')
INSERT INTO Countrys Values('Singapore')
INSERT INTO Countrys Values('Slovakia')
INSERT INTO Countrys Values('Slovenia')
INSERT INTO Countrys Values('Solomon Islands')
INSERT INTO Countrys Values('Somalia')
INSERT INTO Countrys Values('South Africa')
INSERT INTO Countrys Values('South Korea')
INSERT INTO Countrys Values('South Sudan')
INSERT INTO Countrys Values('Spain')
INSERT INTO Countrys Values('Sri Lanka')
INSERT INTO Countrys Values('Sudan')
INSERT INTO Countrys Values('Suriname')
INSERT INTO Countrys Values('Sweden')
INSERT INTO Countrys Values('Switzerland')
INSERT INTO Countrys Values('Syria')
INSERT INTO Countrys Values('Tajikistan')
INSERT INTO Countrys Values('Tanzania')
INSERT INTO Countrys Values('Thailand')
INSERT INTO Countrys Values('Timor-Leste')
INSERT INTO Countrys Values('Togo')
INSERT INTO Countrys Values('Tonga')
INSERT INTO Countrys Values('Trinidad and Tobago')
INSERT INTO Countrys Values('Tunisia')
INSERT INTO Countrys Values('Turkey')
INSERT INTO Countrys Values('Turkmenistan')
INSERT INTO Countrys Values('Tuvalu')
INSERT INTO Countrys Values('Uganda')
INSERT INTO Countrys Values('Ukraine')
INSERT INTO Countrys Values('United Arab Emirates')
INSERT INTO Countrys Values('United Kingdom')
INSERT INTO Countrys Values('United States of America')
INSERT INTO Countrys Values('Uruguay')
INSERT INTO Countrys Values('Uzbekistan')
INSERT INTO Countrys Values('Vanuatu')
INSERT INTO Countrys Values('Venezuela')
INSERT INTO Countrys Values('Vietnam')
INSERT INTO Countrys Values('Yemen')
INSERT INTO Countrys Values('Zambia')
INSERT INTO Countrys Values('Zimbabwe')

INSERT INTO Departement (NameDepartement) Values('Stock')
INSERT INTO Departement (NameDepartement) Values('Direction')
INSERT INTO Departement (NameDepartement) Values('Opérations')
INSERT INTO Departement (NameDepartement) Values('Secrétariat')
INSERT INTO Departement (NameDepartement) Values('réception')
INSERT INTO Departement (NameDepartement) Values('Garde')
INSERT INTO Departement (NameDepartement) Values('Ressources humaines')

INSERT INTO Employee_Language Values('french')
INSERT INTO Employee_Language Values('Nederlands')
INSERT INTO Employee_Language Values('English')


INSERT INTO Informations(Street, StreetNumber, PostCode,Email,Phone, IdCountry ) 
Values('Rue Simon', '48', '6990', 'bogaert@outlook.com', '0487345912' ,1)

INSERT INTO Informations(Street, StreetNumber, PostCode,Email,Phone, IdCountry ) 
Values('Rue de la gare', '130', '1310', 'bogaert@gmail.com', '047854221' ,3)

INSERT INTO Informations(Street, StreetNumber, PostCode,Email,Phone, IdCountry ) 
Values('StationStraat', '27', '6945', 'rabbit@gmail.com', '5248551' ,2)

INSERT INTO Customer([Name], GeneralPhone,EmergencyPhone, EmergencyEmail, IdInformation, IdLanguages, IdStatuts) 
Values ('Danone','0455555555','101','emerg@email.com', 1, 1,21)

INSERT INTO Customer([Name], GeneralPhone,EmergencyPhone, EmergencyEmail, IdInformation, IdLanguages, IdStatuts) 
Values ('Pfeizer','211562252','12541','Test@test.com', 3, 1,21)

INSERT INTO Employee ([Name], firstName, BirthDate, SecurityCardNumber, EntryService, EmployeeCardNumber, RegistreNational, IdLanguage, IdInformation, IdStatut)
Values ('Bogaert','Cédric', '1978/04/01','489513574','2009/09/08','15234576464', '215-58.15-58', 1,1,3)

INSERT INTO Belongs (IdDepartement, IdEmployee) Values(2,1)

INSERT INTO Manage Values(1,1)

INSERT INTO ScheduleGuard (StartTime, EndTime, IdEmployee, IdCustomer) Values(GETDATE(), GETDATE(), 1,1)

insert into RONDE (NameRonde,IdCustomer) Values('Ronde de 23 heure',1)
insert into RONDE (NameRonde,IdCustomer) Values('Ronde de 01 heure',1)
insert into RONDE (NameRonde,IdCustomer) Values('Ronde des frigos',2)
insert into RONDE (NameRonde,IdCustomer) Values('Ronde de fermeture',2)

INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte 23',1,'12562565')
INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte 24',1,'5221212')
INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte d''entrée',1,'6332354544')

INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte d''entrée',2,'4778858')
INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte de sortie',2,'6244554545')
INSERT INTO RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Accès sanitaire',2, '5353456')

insert into RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte nr 10',1,'1251522552')
insert into RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte nr 11',1,'585812521')
insert into RfidPatrol ([Location],IdCustomer,RfidNumber) Values('Porte d''entrée principal',1,'5858225212521')

insert into passage (IdRfid,IdRondes) Values(1,1)
insert into passage (IdRfid,IdRondes) Values(2,1)
insert into passage (IdRfid,IdRondes) Values(9,1)
insert into passage (IdRfid,IdRondes) Values(3,2)
insert into passage (IdRfid,IdRondes) Values(7,2)
insert into passage (IdRfid,IdRondes) Values(8,2)

insert into passage (IdRfid,IdRondes) Values(4,3)
insert into passage (IdRfid,IdRondes) Values(5,3)
insert into passage (IdRfid,IdRondes) Values(6,3)
GO

GO
PRINT N'Mise à jour terminée.';


GO
