CREATE OR ALTER TRIGGER CheckBusCapacity
ON dbo.Excursion
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @CountTouristToActualExcursion INT;
    DECLARE @CountTouristInBusToActualExursion INT;

    SELECT @CountTouristToActualExcursion = Excursion.ActualTouristQuantity,
           @CountTouristInBusToActualExursion = Bus.PassengerQuantity
    FROM Excursion
    INNER JOIN ExcursionType ON Excursion.ExcursionType = ExcursionType.Id
    INNER JOIN Bus ON ExcursionType.Id = Bus.ExcursionType
    WHERE Excursion.ActualTouristQuantity > Bus.PassengerQuantity;

	
    IF (@CountTouristToActualExcursion > @CountTouristInBusToActualExursion)
    BEGIN
		RAISERROR ('There are not enough buses to accommodate all the tourists.', 16, 1);
        ROLLBACK TRANSACTION;
		RETURN;
    END;
END;


UPDATE [dbo].[Excursion]
SET [ActualTouristQuantity] = 60000
WHERE [Id] = 2;

SELECT * from Excursion