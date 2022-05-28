﻿/*
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

ALTER TABLE Product ADD CONSTRAINT FK_PROD_CATEGORY FOREIGN KEY (IdCategory) REFERENCES  Category(IdCategory)

ALTER TABLE Rapport ADD CONSTRAINT FK_RAPPORT_CUST_EMPLOYEE FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)
ALTER TABLE Rapport ADD CONSTRAINT FK_RAPPORT_EMPLOYEE_CUST FOREIGN KEY (IdEmployee) REFERENCES Employee (IdEmployee)

ALTER TABLE Ronde ADD CONSTRAINT FK_RONDE_CUST FOREIGN KEY (IdCustomer) REFERENCES Customer (IdCustomer)

ALTER TABLE Rondier ADD CONSTRAINT FK_EMPLO_RONDE FOREIGN KEY (IdEmployee) REFERENCES Employee(IdEmployee)
ALTER TABLE Rondier ADD CONSTRAINT FK_RONDE_RONDE FOREIGN KEY (IdRonde) REFERENCES Ronde(IdRonde)

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

INSERT INTO Customer([Name], GeneralPhone,EmergencyPhone, EmergencyEmail, IdInformation, IdLanguages, IdStatuts) 
Values ('Danone','0455555555','101','emerg@email.com', 1, 1,21)

INSERT INTO Employee ([Name], firstName, BirthDate, SecurityCardNumber, EntryService, EmployeeCardNumber, RegistreNational, IdLanguage, IdInformation, IdStatut)
Values ('Bogaert','Cédric', '1978/04/01','489513574','2009/09/08','15234576464', '215-58.15-58', 1,1,3)

INSERT INTO Belongs (IdDepartement, IdEmployee) Values(2,1)

INSERT INTO Manage Values(1,1)

INSERT INTO ScheduleGuard (StartTime, EndTime, IdEmployee, IdCustomer) Values(GETDATE(), GETDATE(), 1,1)