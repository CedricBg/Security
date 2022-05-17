/*
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[Belongs]...';


GO
CREATE TABLE [dbo].[Belongs] (
    [IdBelongs]     INT IDENTITY (1, 1) NOT NULL,
    [IdEmployee]    INT NOT NULL,
    [IdDepartement] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdBelongs] ASC)
);


GO
PRINT N'Création de Table [dbo].[Calling]...';


GO
CREATE TABLE [dbo].[Calling] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [IdCustomers]     INT NOT NULL,
    [IdContactPerson] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Category]...';


GO
CREATE TABLE [dbo].[Category] (
    [IdCategory]   INT           IDENTITY (1, 1) NOT NULL,
    [NameProduct]  VARCHAR (50)  NOT NULL,
    [Width]        INT           NULL,
    [Height]       INT           NULL,
    [Weight]       INT           NULL,
    [Confirmation] VARCHAR (255) NULL,
    [IdSub]        INT           NULL,
    PRIMARY KEY CLUSTERED ([IdCategory] ASC)
);


GO
PRINT N'Création de Table [dbo].[Color]...';


GO
CREATE TABLE [dbo].[Color] (
    [IdColor]   INT          IDENTITY (1, 1) NOT NULL,
    [ColorName] VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdColor] ASC)
);


GO
PRINT N'Création de Table [dbo].[Contacting]...';


GO
CREATE TABLE [dbo].[Contacting] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [IdSub]           INT NULL,
    [IdContactPerson] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[ContactPerson]...';


GO
CREATE TABLE [dbo].[ContactPerson] (
    [IdContactPerson] INT          IDENTITY (1, 1) NOT NULL,
    [LastName]        VARCHAR (40) NOT NULL,
    [FirstName]       VARCHAR (40) NULL,
    PRIMARY KEY CLUSTERED ([IdContactPerson] ASC)
);


GO
PRINT N'Création de Table [dbo].[Countrys]...';


GO
CREATE TABLE [dbo].[Countrys] (
    [IdCountrys] INT          IDENTITY (1, 1) NOT NULL,
    [Country]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCountrys] ASC)
);


GO
PRINT N'Création de Table [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [IdCustomer]     INT          IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (50) NOT NULL,
    [GeneralPhone]   VARCHAR (50) NULL,
    [EmergencyPhone] VARCHAR (50) NULL,
    [EmergencyEmail] VARCHAR (50) NULL,
    [IdInformation]  INT          NOT NULL,
    [IdUsers]        INT          NULL,
    PRIMARY KEY CLUSTERED ([IdCustomer] ASC)
);


GO
PRINT N'Création de Table [dbo].[Departement]...';


GO
CREATE TABLE [dbo].[Departement] (
    [IdDepartement]   INT          IDENTITY (1, 1) NOT NULL,
    [NameDepartement] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdDepartement] ASC)
);


GO
PRINT N'Création de Table [dbo].[Employee]...';


GO
CREATE TABLE [dbo].[Employee] (
    [IdEmployee]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (50)  NOT NULL,
    [firstName]          VARCHAR (50)  NOT NULL,
    [BirthDate]          VARCHAR (50)  NOT NULL,
    [Vehicle]            BIT           NOT NULL,
    [SecurityCardNumber] BIGINT        NOT NULL,
    [EntryService]       DATETIME2 (7) NOT NULL,
    [RegistreNational]   VARCHAR (20)  NOT NULL,
    [EmployeeCardNumber] VARCHAR (255) NOT NULL,
    [IdGrade]            INT           NOT NULL,
    [IdLanguage]         INT           NOT NULL,
    [IdInformation]      INT           NOT NULL,
    [IdUsers]            INT           NULL,
    [IdStatut]           INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEmployee] ASC)
);


GO
PRINT N'Création de Table [dbo].[Employee_Language]...';


GO
CREATE TABLE [dbo].[Employee_Language] (
    [IdLanguage] INT          IDENTITY (1, 1) NOT NULL,
    [Language]   VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdLanguage] ASC)
);


GO
PRINT N'Création de Table [dbo].[Grade]...';


GO
CREATE TABLE [dbo].[Grade] (
    [IdGrades] INT          IDENTITY (1, 1) NOT NULL,
    [Grade]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdGrades] ASC)
);


GO
PRINT N'Création de Table [dbo].[Informations]...';


GO
CREATE TABLE [dbo].[Informations] (
    [IdInformation] INT          IDENTITY (1, 1) NOT NULL,
    [Street]        VARCHAR (50) NULL,
    [PostCode]      VARCHAR (30) NULL,
    [StreetNumber]  VARCHAR (20) NULL,
    [IdCountry]     INT          NULL,
    [Phone]         VARCHAR (50) NOT NULL,
    [Email]         VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IdInformation] ASC)
);


GO
PRINT N'Création de Table [dbo].[Manage]...';


GO
CREATE TABLE [dbo].[Manage] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [IdEmployee]    INT NOT NULL,
    [IdDepartement] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Painting]...';


GO
CREATE TABLE [dbo].[Painting] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [IdCategory] INT NOT NULL,
    [IdColor]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[passage]...';


GO
CREATE TABLE [dbo].[passage] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [IdRfid]   VARCHAR (255) NOT NULL,
    [location] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Product]...';


GO
CREATE TABLE [dbo].[Product] (
    [IdProduct]  INT           IDENTITY (1, 1) NOT NULL,
    [Rfid]       VARCHAR (150) NULL,
    [IdCategory] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProduct] ASC)
);


GO
PRINT N'Création de Table [dbo].[RackProduct]...';


GO
CREATE TABLE [dbo].[RackProduct] (
    [IdRack]       INT          IDENTITY (1, 1) NOT NULL,
    [RowNumber]    VARCHAR (30) NULL,
    [RackNumber]   VARCHAR (30) NULL,
    [HeightNumber] VARCHAR (30) NULL,
    [Rfid]         VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IdRack] ASC)
);


GO
PRINT N'Création de Table [dbo].[Rapport]...';


GO
CREATE TABLE [dbo].[Rapport] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [NameRapport] VARCHAR (50)  NOT NULL,
    [DateRapport] DATETIME2 (7) NOT NULL,
    [IdCustomer]  INT           NOT NULL,
    [IdEmployee]  INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[RfidPatrol]...';


GO
CREATE TABLE [dbo].[RfidPatrol] (
    [IdRfid]   VARCHAR (255) NOT NULL,
    [Location] VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([IdRfid] ASC)
);


GO
PRINT N'Création de Table [dbo].[Ronde]...';


GO
CREATE TABLE [dbo].[Ronde] (
    [IdRonde]    BIGINT IDENTITY (1, 1) NOT NULL,
    [IdCustomer] INT    NOT NULL,
    PRIMARY KEY CLUSTERED ([IdRonde] ASC)
);


GO
PRINT N'Création de Table [dbo].[Rondier]...';


GO
CREATE TABLE [dbo].[Rondier] (
    [Id]         INT    IDENTITY (1, 1) NOT NULL,
    [IdEmployee] INT    NOT NULL,
    [IdRonde]    BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[ScheduleGuard]...';


GO
CREATE TABLE [dbo].[ScheduleGuard] (
    [IdSchedule] INT           IDENTITY (1, 1) NOT NULL,
    [StartTime]  DATETIME2 (7) NOT NULL,
    [EndTime]    DATETIME2 (7) NULL,
    [IdEmployee] INT           NULL,
    [IdCustomer] INT           NULL,
    PRIMARY KEY CLUSTERED ([IdSchedule] ASC)
);


GO
PRINT N'Création de Table [dbo].[Searching]...';


GO
CREATE TABLE [dbo].[Searching] (
    [IdSearch]  INT IDENTITY (1, 1) NOT NULL,
    [IdRack]    INT NOT NULL,
    [IdProduct] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSearch] ASC)
);


GO
PRINT N'Création de Table [dbo].[Start_end_Time]...';


GO
CREATE TABLE [dbo].[Start_end_Time] (
    [IdStart]       INT           IDENTITY (1, 1) NOT NULL,
    [ArrivingTime]  DATETIME2 (7) NOT NULL,
    [DepartureTime] DATETIME2 (7) NULL,
    [IdEmployee]    INT           NOT NULL,
    [IdCustomer]    INT           NULL,
    PRIMARY KEY CLUSTERED ([IdStart] ASC)
);


GO
PRINT N'Création de Table [dbo].[StatutAgent]...';


GO
CREATE TABLE [dbo].[StatutAgent] (
    [IdStatut]   INT          IDENTITY (1, 1) NOT NULL,
    [Classe]     VARCHAR (10) NOT NULL,
    [ClasseName] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdStatut] ASC)
);


GO
PRINT N'Création de Table [dbo].[SubContractors]...';


GO
CREATE TABLE [dbo].[SubContractors] (
    [Idsub]           INT IDENTITY (1, 1) NOT NULL,
    [IdContactPerson] INT NOT NULL,
    [IdInformations]  INT NOT NULL,
    [IdUsers]         INT NULL,
    PRIMARY KEY CLUSTERED ([Idsub] ASC)
);


GO
PRINT N'Création de Table [dbo].[Users]...';


GO
CREATE TABLE [dbo].[Users] (
    [IdUser]        INT            IDENTITY (1, 1) NOT NULL,
    [Login]         NCHAR (10)     NOT NULL,
    [Salt]          VARCHAR (100)  NOT NULL,
    [Password_hash] VARBINARY (64) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUser] ASC),
    CONSTRAINT [UK_LOGIN] UNIQUE NONCLUSTERED ([Login] ASC)
);


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 0 FOR [Vehicle];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 0 FOR [SecurityCardNumber];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 0 FOR [EmployeeCardNumber];


GO
PRINT N'Création de Contrainte par défaut contrainte sans nom sur [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 1 FOR [IdGrade];


GO
PRINT N'Création de Clé étrangère [dbo].[FK_BEL_EMPLO1]...';


GO
ALTER TABLE [dbo].[Belongs]
    ADD CONSTRAINT [FK_BEL_EMPLO1] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_BEL_DEPART1]...';


GO
ALTER TABLE [dbo].[Belongs]
    ADD CONSTRAINT [FK_BEL_DEPART1] FOREIGN KEY ([IdDepartement]) REFERENCES [dbo].[Departement] ([IdDepartement]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CUST_CONTACT]...';


GO
ALTER TABLE [dbo].[Calling]
    ADD CONSTRAINT [FK_CUST_CONTACT] FOREIGN KEY ([IdCustomers]) REFERENCES [dbo].[Customer] ([IdCustomer]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CONTACT_CUST]...';


GO
ALTER TABLE [dbo].[Calling]
    ADD CONSTRAINT [FK_CONTACT_CUST] FOREIGN KEY ([IdContactPerson]) REFERENCES [dbo].[ContactPerson] ([IdContactPerson]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CAT_SUB]...';


GO
ALTER TABLE [dbo].[Category]
    ADD CONSTRAINT [FK_CAT_SUB] FOREIGN KEY ([IdSub]) REFERENCES [dbo].[SubContractors] ([Idsub]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SUB_CONTACT_SUB]...';


GO
ALTER TABLE [dbo].[Contacting]
    ADD CONSTRAINT [FK_SUB_CONTACT_SUB] FOREIGN KEY ([IdSub]) REFERENCES [dbo].[SubContractors] ([Idsub]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SUB_CONTACT_PERSON]...';


GO
ALTER TABLE [dbo].[Contacting]
    ADD CONSTRAINT [FK_SUB_CONTACT_PERSON] FOREIGN KEY ([IdContactPerson]) REFERENCES [dbo].[ContactPerson] ([IdContactPerson]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CUST_INFOR]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_CUST_INFOR] FOREIGN KEY ([IdInformation]) REFERENCES [dbo].[Informations] ([IdInformation]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CUST_USERS]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD CONSTRAINT [FK_CUST_USERS] FOREIGN KEY ([IdUsers]) REFERENCES [dbo].[Users] ([IdUser]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_GRADE_EMPLOYEE]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_GRADE_EMPLOYEE] FOREIGN KEY ([IdGrade]) REFERENCES [dbo].[Grade] ([IdGrades]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_LANG_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_LANG_EMPLO] FOREIGN KEY ([IdLanguage]) REFERENCES [dbo].[Employee_Language] ([IdLanguage]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_INFORMATION_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_INFORMATION_EMPLO] FOREIGN KEY ([IdInformation]) REFERENCES [dbo].[Informations] ([IdInformation]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_USERS_EMPLOYEE]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_USERS_EMPLOYEE] FOREIGN KEY ([IdUsers]) REFERENCES [dbo].[Users] ([IdUser]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_EMPLO_STATU]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_EMPLO_STATU] FOREIGN KEY ([IdStatut]) REFERENCES [dbo].[StatutAgent] ([IdStatut]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_COUNTRY_INFO]...';


GO
ALTER TABLE [dbo].[Informations]
    ADD CONSTRAINT [FK_COUNTRY_INFO] FOREIGN KEY ([IdCountry]) REFERENCES [dbo].[Countrys] ([IdCountrys]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_BEL_EMPLO2]...';


GO
ALTER TABLE [dbo].[Manage]
    ADD CONSTRAINT [FK_BEL_EMPLO2] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_BEL_DEPART2]...';


GO
ALTER TABLE [dbo].[Manage]
    ADD CONSTRAINT [FK_BEL_DEPART2] FOREIGN KEY ([IdDepartement]) REFERENCES [dbo].[Departement] ([IdDepartement]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PAIN_CAT_COL]...';


GO
ALTER TABLE [dbo].[Painting]
    ADD CONSTRAINT [FK_PAIN_CAT_COL] FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Category] ([IdCategory]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PAIN_COL_CAT]...';


GO
ALTER TABLE [dbo].[Painting]
    ADD CONSTRAINT [FK_PAIN_COL_CAT] FOREIGN KEY ([IdColor]) REFERENCES [dbo].[Color] ([IdColor]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PASSA_RFID]...';


GO
ALTER TABLE [dbo].[passage]
    ADD CONSTRAINT [FK_PASSA_RFID] FOREIGN KEY ([IdRfid]) REFERENCES [dbo].[RfidPatrol] ([IdRfid]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PROD_CATEGORY]...';


GO
ALTER TABLE [dbo].[Product]
    ADD CONSTRAINT [FK_PROD_CATEGORY] FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Category] ([IdCategory]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_RAPPORT_CUST_EMPLOYEE]...';


GO
ALTER TABLE [dbo].[Rapport]
    ADD CONSTRAINT [FK_RAPPORT_CUST_EMPLOYEE] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customer] ([IdCustomer]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_RAPPORT_EMPLOYEE_CUST]...';


GO
ALTER TABLE [dbo].[Rapport]
    ADD CONSTRAINT [FK_RAPPORT_EMPLOYEE_CUST] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_RONDE_CUST]...';


GO
ALTER TABLE [dbo].[Ronde]
    ADD CONSTRAINT [FK_RONDE_CUST] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customer] ([IdCustomer]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_EMPLO_RONDE]...';


GO
ALTER TABLE [dbo].[Rondier]
    ADD CONSTRAINT [FK_EMPLO_RONDE] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_RONDE_RONDE]...';


GO
ALTER TABLE [dbo].[Rondier]
    ADD CONSTRAINT [FK_RONDE_RONDE] FOREIGN KEY ([IdRonde]) REFERENCES [dbo].[Ronde] ([IdRonde]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SCHEDU_EMPLO]...';


GO
ALTER TABLE [dbo].[ScheduleGuard]
    ADD CONSTRAINT [FK_SCHEDU_EMPLO] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SCHEDU_CUST]...';


GO
ALTER TABLE [dbo].[ScheduleGuard]
    ADD CONSTRAINT [FK_SCHEDU_CUST] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customer] ([IdCustomer]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SEARCH_RACK]...';


GO
ALTER TABLE [dbo].[Searching]
    ADD CONSTRAINT [FK_SEARCH_RACK] FOREIGN KEY ([IdRack]) REFERENCES [dbo].[RackProduct] ([IdRack]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SEARCH_PRODUCT]...';


GO
ALTER TABLE [dbo].[Searching]
    ADD CONSTRAINT [FK_SEARCH_PRODUCT] FOREIGN KEY ([IdProduct]) REFERENCES [dbo].[Product] ([IdProduct]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_START_EMPLO]...';


GO
ALTER TABLE [dbo].[Start_end_Time]
    ADD CONSTRAINT [FK_START_EMPLO] FOREIGN KEY ([IdEmployee]) REFERENCES [dbo].[Employee] ([IdEmployee]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_START_CUST]...';


GO
ALTER TABLE [dbo].[Start_end_Time]
    ADD CONSTRAINT [FK_START_CUST] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customer] ([IdCustomer]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_INFO_PERSO]...';


GO
ALTER TABLE [dbo].[SubContractors]
    ADD CONSTRAINT [FK_INFO_PERSO] FOREIGN KEY ([IdContactPerson]) REFERENCES [dbo].[ContactPerson] ([IdContactPerson]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_INFO_SUB]...';


GO
ALTER TABLE [dbo].[SubContractors]
    ADD CONSTRAINT [FK_INFO_SUB] FOREIGN KEY ([IdInformations]) REFERENCES [dbo].[Informations] ([IdInformation]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_SUB_USERS]...';


GO
ALTER TABLE [dbo].[SubContractors]
    ADD CONSTRAINT [FK_SUB_USERS] FOREIGN KEY ([IdUsers]) REFERENCES [dbo].[Users] ([IdUser]);


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2d9a89bd-a5b1-4b40-b09c-f603c810a7ba')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2d9a89bd-a5b1-4b40-b09c-f603c810a7ba')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ead3036d-8c67-4380-bf52-481fee0c1b54')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ead3036d-8c67-4380-bf52-481fee0c1b54')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f54632f1-2117-45d8-90e2-1328752a16e4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f54632f1-2117-45d8-90e2-1328752a16e4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '347ae946-77a6-46be-b724-e76abaeb4f6d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('347ae946-77a6-46be-b724-e76abaeb4f6d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '68e3f327-6620-4072-83e7-978398fee917')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('68e3f327-6620-4072-83e7-978398fee917')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1e6c0d6c-25a4-4296-8d60-3f037cd7c9d8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1e6c0d6c-25a4-4296-8d60-3f037cd7c9d8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eb31a532-fb15-4f53-b740-3572ccb97cd6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eb31a532-fb15-4f53-b740-3572ccb97cd6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cc3d1819-14e5-4856-9746-25b2afb68067')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cc3d1819-14e5-4856-9746-25b2afb68067')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '042a9f27-6c26-49b4-91be-7334481db499')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('042a9f27-6c26-49b4-91be-7334481db499')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '768176de-3f00-4b78-962a-f210ed9ae14d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('768176de-3f00-4b78-962a-f210ed9ae14d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fd8fb7af-69e6-4345-a213-53023bb19085')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fd8fb7af-69e6-4345-a213-53023bb19085')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '818260fb-672f-4200-a1f8-69b9e48604a8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('818260fb-672f-4200-a1f8-69b9e48604a8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '463efcfd-48c9-4408-8976-8f7571b27a8a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('463efcfd-48c9-4408-8976-8f7571b27a8a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '570a791d-d7e6-40f1-b22a-9b00ed4fc8b4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('570a791d-d7e6-40f1-b22a-9b00ed4fc8b4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f571390b-5976-4034-8310-eb74107e7b21')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f571390b-5976-4034-8310-eb74107e7b21')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cbb3d454-7de6-460a-912e-28033d83045b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cbb3d454-7de6-460a-912e-28033d83045b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '948857c2-6e75-4c9b-a64f-7a6c49731e7b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('948857c2-6e75-4c9b-a64f-7a6c49731e7b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e5b52202-80cf-495a-b8a6-4a9d87bfd4e6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e5b52202-80cf-495a-b8a6-4a9d87bfd4e6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '227c82c2-32e5-4573-97fc-9d95b6e4cbb6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('227c82c2-32e5-4573-97fc-9d95b6e4cbb6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e246a539-8745-41fa-b353-79a8593a2397')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e246a539-8745-41fa-b353-79a8593a2397')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9e96d98e-a2ee-4a22-b08d-4ef68e9c3075')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9e96d98e-a2ee-4a22-b08d-4ef68e9c3075')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '05e98ed3-7947-4422-9a34-ab2dcff813fe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('05e98ed3-7947-4422-9a34-ab2dcff813fe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8f09e53b-ee73-439b-ba4c-3dd40122093d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8f09e53b-ee73-439b-ba4c-3dd40122093d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '28c89a17-1ca9-4298-9145-85d083a380f0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('28c89a17-1ca9-4298-9145-85d083a380f0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c8c79c1a-1a63-421d-ba46-5b90212cc069')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c8c79c1a-1a63-421d-ba46-5b90212cc069')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ba4f12cf-ff89-4612-904d-b6a11f7bf3eb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ba4f12cf-ff89-4612-904d-b6a11f7bf3eb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fa5011d0-37f5-4560-b6c6-f5c49e62c592')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fa5011d0-37f5-4560-b6c6-f5c49e62c592')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b0d2198a-e332-4961-8d9e-aa6236a69040')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b0d2198a-e332-4961-8d9e-aa6236a69040')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3e6ac1b8-ea32-42ff-8280-8f6970fdb73d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3e6ac1b8-ea32-42ff-8280-8f6970fdb73d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1786dfa9-48d3-452e-8fb8-b5e4a5e2f073')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1786dfa9-48d3-452e-8fb8-b5e4a5e2f073')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4aca9812-5547-4a65-b480-63dc78ef69b1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4aca9812-5547-4a65-b480-63dc78ef69b1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '70ac3891-39b5-4ba0-9718-e4a0907802f8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('70ac3891-39b5-4ba0-9718-e4a0907802f8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '588273f2-1517-433e-804a-421104a5c577')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('588273f2-1517-433e-804a-421104a5c577')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '38ba79c4-29d1-49c2-8405-e3a922b55788')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('38ba79c4-29d1-49c2-8405-e3a922b55788')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0b7b1d5e-e69a-49f5-acc9-e92c69864b7f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0b7b1d5e-e69a-49f5-acc9-e92c69864b7f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '08d50ec9-001e-4ccb-a042-eec37832699a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('08d50ec9-001e-4ccb-a042-eec37832699a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '298a506f-332e-4466-ba8d-22b79aa9f55b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('298a506f-332e-4466-ba8d-22b79aa9f55b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3118fd6f-fec5-42ae-8780-253194c4c0cd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3118fd6f-fec5-42ae-8780-253194c4c0cd')

GO

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
INSERT INTO StatutAgent (Classe, ClasseName) Values('SB', 'Agent statique' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SQ', 'Agent statique qualifié' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SE', 'Agent statique expert' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SEL', 'Agent statique expert langues' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SBG', 'Agent statique bodyguard' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('MB', 'Agent statique base militaire' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('SMBP', 'Portier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('MBB', 'Brigadier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('M1', 'Agent mobile patrouille' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('M2', 'Agent mobile IAA et chauffeur VIP' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('TR', 'Transporteur de fonds/agent ATM' );
INSERT INTO StatutAgent (Classe, ClasseName) Values('PRVA', 'Collaborateur vault /processing' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('BI', 'Brigadier/instructeur' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('TM', 'Transport de munitions' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('G', 'Homme de métier' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('DIR', 'Direction' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('OP', 'Opérations' )
INSERT INTO StatutAgent (Classe, ClasseName) Values('ADM', 'Administratif' )

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

INSERT INTO Employee_Language Values('french')

INSERT INTO Informations(Street, StreetNumber, PostCode,Email,Phone, IdCountry ) Values('Rue Simon', 48, '6990', 'bogaert@outlook.com', '0487345912' ,1)

INSERT INTO Employee ([Name], firstName, BirthDate, SecurityCardNumber, EntryService, EmployeeCardNumber, RegistreNational,IdStatut, IdLanguage, IdInformation)
Values ('Bogaert','Cédric', '1978/04/01','489513574','2009/09/08','15234576464', '215-58.15-58', 1,1,1)
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
