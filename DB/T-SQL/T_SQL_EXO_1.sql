
CREATE DATABASE T_SQL_EXO_1
GO

USE T_SQL_EXO_1
GO

CREATE TABLE Membre
(
	Pseudo VARCHAR(50) NOT NULL PRIMARY KEY,
	Email VARCHAR(99) NOT NULL UNIQUE,
	MotDePasse VARCHAR(255) NOT NULL, 
	DateDeNaissance DATE,
	DateDInscription DATE,
	Ville VARCHAR(25)
)
GO

SELECT * FROM Membre
GO


INSERT INTO Membre VALUES ('Om@r2', 'omar2@gmail.com', '123456', '1980-03-12', '2006-06-15', 'Tinghir')
GO

INSERT INTO Membre VALUES ('R@chid', 'rachide@gmail.com', '654321', '12/05/1985', '14/02/2012', 'Goulmima')
GO

--Q1
DECLARE @ville VARCHAR(25)
SELECT @ville = 'Tinghir'

--Q2
SELECT * FROM Membre WHERE Ville LIKE @ville

--Q3
DECLARE @nbrMembres INT

--Q4
SELECT @nbrMembres = COUNT(*) FROM Membre

--Q5
SELECT Ville
		,CAST(CAST(COUNT(Pseudo) AS DECIMAL(4, 2))/@nbrMembres AS DECIMAL(4, 2)) AS Taux
FROM Membre
GROUP BY Ville
HAVING CAST(CAST(COUNT(Pseudo) AS DECIMAL(4, 2))/@nbrMembres AS DECIMAL(4, 2)) >= 0.2

--Q6
DECLARE @dateDemarrage DATE

--Q7
SELECT @dateDemarrage = MIN(DateDInscription) FROM Membre

--Q8
DECLARE @dateQ8 DATE
SELECT @dateQ8 = DATEADD(DAY, 10, @dateDemarrage)

--Q9
DECLARE @nbrInscrits1 INT
SELECT @nbrInscrits1 = COUNT(*) FROM Membre WHERE DateDInscription BETWEEN @dateDemarrage AND @dateQ8

--Q10
DECLARE @nbrInscrits2 INT
SELECT @nbrInscrits2 = COUNT(*) FROM Membre WHERE DateDInscription BETWEEN @dateQ8 AND DATEADD(DAY, 10, @dateQ8)


--Q11
DECLARE @tauxEvolution DECIMAL(4, 2)
SELECT @tauxEvolution = (@nbrInscrits2 - @nbrInscrits1)/@nbrInscrits1


--Q12
DECLARE @ageMoy DECIMAL(4, 2)
SELECT @ageMoy = AVG(DATEDIFF(DAY, DateDeNaissance, GETDATE()) / 365.00) FROM Membre

--Q13
SELECT * FROM Membre WHERE DATEDIFF(DAY, DateDeNaissance, GETDATE()) / 365.00 >= @ageMoy



-- Exos

DECLARE @nombre INT
SELECT @nombre = 7

DECLARE @resultat INT

DECLARE @I INT
SELECT @I = 0

WHILE @I < 11
	BEGIN
		SELECT @resultat = @nombre * @I
		PRINT CAST(@I AS VARCHAR) + ' * ' + CAST(@nombre AS VARCHAR) + ' = ' + CAST(@resultat AS VARCHAR)

		SELECT @I = @I + 1
	END
GO

DECLARE @nombre INT
SELECT @nombre = 5

DECLARE @resultat INT
SELECT @resultat = 1

WHILE @nombre > 0
	BEGIN
		SELECT @resultat = @nombre * @resultat
		SELECT @nombre = @nombre - 1
	END

PRINT @resultat
GO




