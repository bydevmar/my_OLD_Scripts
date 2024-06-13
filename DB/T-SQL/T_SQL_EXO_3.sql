USE T_SQL_EXO_1
GO

IF OBJECT_ID('Bonus') IS NOT NULL
	BEGIN
		PRINT 'Table Bonus existe déjà'
	END
ELSE IF OBJECT_ID('FK_Bonus_Membre') IS NOT NULL
	BEGIN
		PRINT 'Clé étrangère existe déjà'
	END
ELSE
	BEGIN
		CREATE TABLE Bonus
		(
			Pseudo VARCHAR(50) NOT NULL PRIMARY KEY,
			NbrPoints INT DEFAULT 0,

			CONSTRAINT FK_Bonus_Membre FOREIGN KEY (Pseudo) REFERENCES Membre(Pseudo)
		)
	END
GO

SELECT * FROM Membre
GO
SELECT * FROM Bonus
GO

INSERT INTO Bonus VALUES ('Om@r2', 3)
GO

DECLARE @pseudo VARCHAR(50)
SELECT @pseudo = 'R@chid'

DECLARE @points INT
SELECT @points = 13

IF NOT EXISTS(SELECT 1 FROM Membre WHERE Pseudo LIKE @pseudo)
	BEGIN
		PRINT 'Membre n''existe pas'
	END
ELSE
	BEGIN
		IF EXISTS(SELECT 1 FROM Bonus WHERE Pseudo LIKE @pseudo)
			BEGIN
				UPDATE Bonus
				SET NbrPoints = NbrPoints + @points
				WHERE Pseudo = @pseudo
			END
		ELSE
			BEGIN
				INSERT INTO Bonus VALUES (@pseudo, @points)
			END
	END
GO



