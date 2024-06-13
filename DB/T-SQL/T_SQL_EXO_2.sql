
-- Déclarations
DECLARE @consommation DECIMAL(10,2)
DECLARE @montantFacture MONEY

-- Initialisations
SELECT @consommation = 40
SELECT @montantFacture = 0

-- Traitement

IF @consommation >= 36
	BEGIN
		SELECT @montantFacture = @montantFacture + (@consommation - 36) * 10.37
		SELECT @consommation = 36
	END

IF @consommation >= 20
	BEGIN
		SELECT @montantFacture = @montantFacture + (@consommation - 20) * 6.59
		SELECT @consommation = 20
	END

IF @consommation >= 9
	BEGIN
		SELECT @montantFacture = @montantFacture + (@consommation - 9) * 4.29
		SELECT @consommation = 9
	END

IF @consommation > 0
	BEGIN
		SELECT @montantFacture = @montantFacture + @consommation * 1.29
		SELECT @consommation = 0
	END

PRINT @montantFacture

GO
