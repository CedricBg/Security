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
GO
