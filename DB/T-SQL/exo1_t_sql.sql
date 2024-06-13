

CREATE DATABASE EXO1_T_SQL
GO

USE EXO1_T_SQL
Go

IF (OBJECT_ID('Membre') IS NULL)
	BEGIN
		CREATE TABLE Membre
		(
			Pseudo VARCHAR(99) NOT NULL PRIMARY KEY,
			Email VARCHAR(99) NOT NULL UNIQUE,
			MotDePasse VARCHAR(255) NOT NULL,
			DateNaissance DATE,
			DateInscription DATETIME DEFAULT GETDATE(),
			Ville VARCHAR(55)
		)
		PRINT 'La table Membre a bien été créée.'
	END
ELSE
	BEGIN
		PRINT 'La table Membre existe déjà.'
	END
GO

INSERT INTO Membre VALUES ('Pseudo1', 'email1@email.com', '123456', '01/02/1999', '15/07/2017', 'Tinghir')
GO
INSERT INTO Membre VALUES ('Pseudo2', 'email2@email.com', '123456', '01/02/1999', '15/07/2018', 'Tinghir')
GO
INSERT INTO Membre VALUES ('Pseudo3', 'email3@email.com', '123456', '01/02/1999', '15/11/2017', 'Tinejdad')
GO
INSERT INTO Membre VALUES ('Pseudo4', 'email4@email.com', '123456', '01/02/1999', '15/05/2016', 'Ouarzazate')
GO
INSERT INTO Membre VALUES ('Pseudo5', 'email5@email.com', '123456', '01/02/1999', '15/07/2017', 'Tinghir')
GO
INSERT INTO Membre VALUES ('Pseudo6', 'email6@email.com', '123456', '01/02/1999', '15/07/2017', 'Ouarzazate')
GO
INSERT INTO Membre VALUES ('Pseudo7', 'email7@email.com', '123456', '01/02/1954', '15/07/2017', 'Ouarzazate')
GO

-- Q1

DECLARE @Ville VARCHAR(55)

SET @Ville = 'Tinghir'
SELECT @Ville = 'Tinghir'


-- Q2


SELECT *
FROM Membre
WHERE Ville LIKE @Ville


-- Q3

DECLARE @NbMembres INT


-- Q4

SELECT @NbMembres = COUNT(Pseudo) FROM Membre
PRINT @NbMembres


-- Q5

SELECT Ville, CAST(CAST((CAST(COUNT(Pseudo) AS FLOAT) / @NbMembres) * 100 AS DECIMAL(4, 2)) AS VARCHAR) + '%'  AS 'Taux de membres'
FROM Membre
GROUP BY Ville
HAVING CAST(CAST(COUNT(Pseudo) AS FLOAT)/@NbMembres AS DECIMAL(4, 2)) >= 0.2

GO

-- Q6

DECLARE @DateDemarrage DATETIME

-- Q7

SELECT TOP 1 @DateDemarrage = DateInscription FROM Membre ORDER BY DateInscription ASC

PRINT @DateDemarrage

-- Q8

DECLARE @DateDemarrage10 DATETIME

SELECT @DateDemarrage10 = DATEADD(DAY, 10, @DateDemarrage)
PRINT @DateDemarrage10

-- Q9

DECLARE @NbrInscrits10 INT

SELECT @NbrInscrits10 = COUNT(Pseudo) FROM Membre WHERE DateInscription BETWEEN @DateDemarrage AND @DateDemarrage10

PRINT @NbrInscrits10

-- Q10

DECLARE @NbrInscrits20 INT

SELECT @NbrInscrits20 = COUNT(Pseudo) FROM Membre WHERE DateInscription BETWEEN @DateDemarrage10 AND DATEADD(DAY, 10, @DateDemarrage10)

PRINT @NbrInscrits20

-- Q11

DECLARE @TauxEvolution DECIMAL(10, 2)

SELECT @TauxEvolution = @NbrInscrits20 - @NbrInscrits10 / CAST(@NbrInscrits10 AS FLOAT)

PRINT @TauxEvolution


-- Q12

DECLARE @AgeMoyen INT

SELECT @AgeMoyen = AVG(DATEDIFF(YEAR, DateNaissance, GETDATE())) FROM Membre

PRINT @AgeMoyen


-- Q13

SELECT *
FROM Membre
WHERE DATEDIFF(YEAR, DateNaissance, GETDATE()) > @AgeMoyen







