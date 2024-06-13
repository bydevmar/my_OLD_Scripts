CREATE DATABASE Exercice4_T_SQL
GO

USE Exercice4_T_SQL
GO

---- Cr�ation des tables

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID('Heure_RDV'))
	BEGIN
		CREATE TABLE Heure_RDV
		(
			Heure TIME NOT NULL PRIMARY KEY
		)
	END
ELSE
	BEGIN
		PRINT 'La table Heure_RDV existe d�j�'
	END
GO
SELECT * FROM Heure_RDV
GO

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = OBJECT_ID('RDV'))
	BEGIN
		CREATE TABLE RDV
		(
			Num_RDV INT NOT NULL IDENTITY PRIMARY KEY,
			Date_RDV DATE NOT NULL,
			Heure_RDV TIME NOT NULL,
			Patient VARCHAR(55) NOT NULL,

			CONSTRAINT FK_RDV_HEURE_RDV FOREIGN KEY (Heure_RDV)
			REFERENCES Heure_RDV(Heure)
			ON UPDATE CASCADE
			ON DELETE CASCADE
		)
	END
ELSE
	BEGIN
		PRINT 'La table RDV existe d�j�'
	END
GO
SELECT * FROM Heure_RDV
GO

DECLARE @HeureDebut TIME
SET @HeureDebut = '08:00:00'

DECLARE @HeureFin TIME
SET @HeureFin = '14:00:00'

DECLARE @Duree INT
SET @Duree = 20

DELETE FROM Heure_RDV

DECLARE @Heure TIME
SET @Heure = @HeureDebut
WHILE (@Heure < @HeureFin)
	BEGIN
		INSERT INTO Heure_RDV VALUES (@Heure)
		SET @Heure = DATEADD(MINUTE, @Duree, @Heure)
	END

GO
SELECT * FROM Heure_RDV
GO
SELECT * FROM RDV
GO


DECLARE @Jour DATE
SET @Jour = GETDATE()


DECLARE @Heure_RDV TIME
SET @Heure_RDV = NULL


WHILE (@Heure_RDV IS NULL)
	BEGIN
		IF (DATEPART(WEEKDAY, @JOUR) NOT IN (6, 7))
			BEGIN
				IF EXISTS (SELECT Heure FROM Heure_RDV EXCEPT SELECT Heure_RDV FROM RDV WHERE Date_RDV = @Jour)
					BEGIN
						SET @Heure_RDV =  (SELECT TOP 1 T.Heure FROM (SELECT Heure FROM Heure_RDV EXCEPT SELECT Heure_RDV FROM RDV WHERE Date_RDV = @Jour) AS T)
					END
			END
		ELSE
			BEGIN
				SET @Jour = DATEADD(DAY, 1, @Jour)
			END
	END

PRINT 'Rendez-vous: '
PRINT @Jour
PRINT @Heure_RDV
GO






