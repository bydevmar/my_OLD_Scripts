
CREATE DATABASE T_SQL_EXO_4
GO

USE T_SQL_EXO_4
GO


IF OBJECT_ID('RDV') IS NULL
	BEGIN
		CREATE TABLE RDV
		(
			NumRDV INT NOT NULL IDENTITY PRIMARY KEY,
			DateRDV DATE NOT NULL,
			HeureRDV TIME NOT NULL,
			Patient VARCHAR(99) NOT NULL
		)
	END
ELSE
	BEGIN
		PRINT 'La table RDV existe d�j�'
	END
GO
INSERT INTO RDV VALUES ('29/06/2018', '08:00', 'Amine')
GO


IF OBJECT_ID('HEURE_RDV') IS NULL
	BEGIN
		CREATE TABLE HEURE_RDV
		(
			Heure TIME NOT NULL PRIMARY KEY
		)
	END
ELSE
	BEGIN
		PRINT 'La table HEURE_RDV existe d�j�'
	END
GO



DECLARE @HeureDebut TIME
DECLARE @HeureFin TIME
DECLARE @Duree INT

SELECT @HeureDebut = '08:00'
SELECT @HeureFin = '14:00'
SELECT @Duree = 20

DELETE FROM HEURE_RDV

WHILE @HeureDebut < @HeureFin
	BEGIN
		INSERT INTO HEURE_RDV VALUES(@HeureDebut)
		SELECT @HeureDebut = DATEADD(MINUTE, @Duree, @HeureDebut)
	END


GO

SELECT * FROM HEURE_RDV
GO

DECLARE @Jour DATE
SELECT @Jour = GETDATE()


DECLARE @HeureRDV TIME
SELECT @HeureRDV = NULL

WHILE @HeureRDV IS NULL
	BEGIN
		IF DATEPART(WEEKDAY, @Jour) NOT IN (6, 7)
			BEGIN				
				SELECT @HeureRDV = MIN(R.Heure) FROM
				(
					SELECT Heure FROM HEURE_RDV 
					EXCEPT 
					SELECT HeureRDV FROM RDV WHERE DateRDV = @jour
				) AS R

				IF (CAST(GETDATE() AS DATE) = @Jour AND @HeureRDV < CAST(DATEPART(HOUR, GETDATE()) AS VARCHAR(2)) + ':' + CAST(DATEPART(MINUTE, GETDATE()) AS VARCHAR(2)))
					BEGIN
						SELECT @HeureRDV = NULL
					END
			END
		IF @HeureRDV IS NULL
			BEGIN
				SELECT @Jour = DATEADD(DAY, 1, @Jour)
			END
	END

PRINT @Jour
PRINT @HeureRDV

GO



