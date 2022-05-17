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
    [IdGrade]            INT           NOT NULL,
    [IdLanguage]         INT           NOT NULL,
    [IdInformation]      INT           NOT NULL,
    [IdUsers]            INT           NULL,
    [EmployeeCardNumber] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEmployee] ASC)
);


GO
PRINT N'Création de Table [dbo].[Employee_Language]...';


GO
CREATE TABLE [dbo].[Employee_Language] (
    [IdLanguage] INT            IDENTITY (1, 1) NOT NULL,
    [Language]   VARBINARY (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdLanguage] ASC)
);


GO
PRINT N'Création de Table [dbo].[Grade]...';


GO
CREATE TABLE [dbo].[Grade] (
    [IdGrade] INT          IDENTITY (1, 1) NOT NULL,
    [Grade]   VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IdGrade] ASC)
);


GO
PRINT N'Création de Table [dbo].[Informations]...';


GO
CREATE TABLE [dbo].[Informations] (
    [IdInformation] INT            IDENTITY (1, 1) NOT NULL,
    [Street]        VARBINARY (40) NULL,
    [PastCode]      VARCHAR (30)   NULL,
    [StreetNumber]  VARCHAR (20)   NULL,
    [IdCountry]     INT            NULL,
    [Phone]         VARCHAR (50)   NOT NULL,
    [Email]         VARCHAR (50)   NULL,
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
PRINT N'Création de Clé étrangère [dbo].[FK_GRADE_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_GRADE_EMPLO] FOREIGN KEY ([IdGrade]) REFERENCES [dbo].[Grade] ([IdGrade]);


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
PRINT N'Création de Clé étrangère [dbo].[FK_USERS_EMPLO]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [FK_USERS_EMPLO] FOREIGN KEY ([IdUsers]) REFERENCES [dbo].[Users] ([IdUser]);


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
