/*SET LANGUAGE French
GO

CREATE DATABASE EXO1_T_SQL
GO

USE EXO1_T_SQL
GO

CREATE TABLE Membre
(
	Pseudo NVARCHAR(99) NOT NULL PRIMARY KEY,
	Email NVARCHAR(250) NOT NULL UNIQUE,
	MotDePasse NVARCHAR(255) NOT NULL,
	DateDeNaissance DATE NOT NULL,
	DateInscription DATE NOT NULL DEFAULT GETDATE(),
	Ville NVARCHAR(99) NOT NULL
)
GO

INSERT INTO Membre VALUES (N'user1',N'user1@user.com', N'123456','16/08/1990','15/07/2017', N'TINGHIR')
INSERT INTO Membre VALUES (N'user2',N'user2@user.com', N'654321','22/02/1985','15/11/2015', N'Casablanca')
INSERT INTO Membre VALUES (N'user3',N'user3@user.com', N'963258','01/03/1991','18/06/2015', N'Tanger')
INSERT INTO Membre VALUES (N'user4',N'user4@user.com', N'874521','01/06/1987','22/10/2015', N'TINGHIR')
INSERT INTO Membre VALUES (N'user5',N'user5@user.com', N'813279','16/09/1990','23/04/2016', N'TINGHIR')
INSERT INTO Membre VALUES (N'user6',N'user6@user.com', N'813279','27/09/1994','18/04/2017', N'Rabat')
INSERT INTO Membre VALUES (N'user7',N'user7@user.com', N'648237','27/09/1990','19/06/2015', N'Casablanca')
GO

SELECT * FROM Membre
GO
*/

-- 1.Déclarer une variable @ville et l’initialiser avec le nom de votre ville

DECLARE @Ville NVARCHAR(99)
SET @Ville = N'TINGHIR'
SELECT @Ville = N'TINGHIR'

--2.En utilisant la variable @ville dans une requête SELECT, renvoyer la liste des membres originaire de votre ville.

SELECT *
FROM Membre
WHERE UPPER(Ville) LIKE UPPER(@Ville)

--3.Déclarer une variable @nbMembre de type int

DECLARE @nbMembre INT

--4.Affecter à cette variable le nombre total des membres du forum

SELECT @nbMembre = COUNT(*) FROM Membre

--5.Afficher, si elles existent, les villes contenant plus que 20% du nombre total des membres

SELECT Ville, CAST(CAST(COUNT(Ville) AS DECIMAL(4, 2))/@nbMembre * 100 AS DECIMAl(4, 2)) AS Taux
FROM Membre
GROUP BY Ville
HAVING CAST(CAST(COUNT(Ville) AS DECIMAL(4, 2))/@nbMembre * 100 AS DECIMAl(4, 2)) >= 20

--6.Déclarer une variable @DateDémarrage de type date

DECLARE @DateDemarrage DATE

-- 7.Affecter à cette variable la date d’inscription du premier membre (la date d’inscription la plus ancienne)

/*
SELECT TOP 1 DateInscription
FROM Membre
ORDER BY DateInscription ASC
*/

SELECT @DateDemarrage = MIN(DateInscription)
FROM Membre

--SET @DateDemarrage = (SELECT MIN(DateInscription) FROM Membre)

--8.Affecter à une autre variable la date du dixième jour après l’inscription du premier membre, (utiliser DATEADD (day , 10, @DateDémarrage))

DECLARE @DateDemarrage10j DATE

SELECT @DateDemarrage10j = DATEADD(DAY, 10, @DateDemarrage)

--SET @DateDemarrage10j = DATEADD(DAY, 10, @DateDemarrage)

--9.En utilisant les deux variables, calculer le nombre des membres inscrits, pendant les 10 premiers jours.

DECLARE @NbrInscrit1 INT

SELECT @NbrInscrit1 = COUNT(*)
FROM Membre
WHERE DateInscription BETWEEN @DateDemarrage AND @DateDemarrage10j

--10.De la même manière, calculer le nombre des inscrits les 10 jours suivants

DECLARE @NbrInscrit2 INT

SELECT @NbrInscrit2 = COUNT(*)
FROM Membre
WHERE DateInscription BETWEEN @DateDemarrage10j AND DATEADD(DAY, 10, @DateDemarrage10j)

--11.	Quel était le taux d’évolution du nombre d’inscription ? taux d’évolution = (Nombre d’inscrits 2 - Nombre d’inscrits 1) / Nombre d’inscrits 1

DECLARE @TauxEvolution DECIMAL(6, 2)

SELECT @TauxEvolution = (@NbrInscrit2 - @NbrInscrit1)/@NbrInscrit1

PRINT @TauxEvolution

--12.Calculer dans une nouvelle variable l’âge moyen des membres

DECLARE @AgeMoyen INT

SELECT @AgeMoyen = AVG(DATEDIFF(YEAR, DateDeNaissance, GETDATE()))
FROM Membre

SELECT *
FROM Membre
WHERE DATEDIFF(YEAR, DateDeNaissance, GETDATE()) > @AgeMoyen


