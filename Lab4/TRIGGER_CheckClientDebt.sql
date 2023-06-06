CREATE OR ALTER TRIGGER CheckClientDebtAndBusCapacity
ON dbo.Excursion
AFTER INSERT, UPDATE
AS
    SET NOCOUNT ON;
	
    DECLARE @ExcursionId INT, @ClientId INT, @CountTouristToActualExcursion INT, @CountTouristInBusToActualExursion INT;

    SELECT @ExcursionId = inserted.Id, @ClientId = inserted.Client
    FROM inserted;

    DECLARE @DebtAmount INT, @PaymentDate DATE;  

    SELECT @DebtAmount = c.AmountOwed, @PaymentDate = pa.PaymentDate
    FROM dbo.Client c
    inner JOIN dbo.PaymentAccounting pa ON pa.ClientId = c.Id
    WHERE c.Id = @ClientId
    ORDER BY pa.PaymentDate DESC;

    DECLARE @DaysPassed INT;
    SET @DaysPassed = DATEDIFF(DAY, @PaymentDate, GETDATE());

	 SELECT @CountTouristToActualExcursion = Excursion.ActualTouristQuantity,
           @CountTouristInBusToActualExursion = Bus.PassengerQuantity
    FROM Excursion
    INNER JOIN ExcursionType ON Excursion.ExcursionType = ExcursionType.Id
    INNER JOIN Bus ON ExcursionType.Id = Bus.ExcursionType
    WHERE Excursion.ActualTouristQuantity > Bus.PassengerQuantity;
	
	 IF (@CountTouristToActualExcursion > @CountTouristInBusToActualExursion)
	BEGIN
		PRINT('1');
		RAISERROR ('There are not enough buses to accommodate all the tourists.', 16, 1);
		 ROLLBACK TRANSACTION;
        RETURN;
	END
    IF (@DebtAmount IS NOT NULL AND @DebtAmount > 0 AND @DaysPassed > 30)
	BEGIN
		RAISERROR ('The client has a debt for more than 30 days!', 16, 1);
		PRINT('2');
		 ROLLBACK TRANSACTION;
         RETURN;
	END
	
GO

UPDATE dbo.Excursion
SET ActualTouristQuantity = 10
WHERE Id = 3;


UPDATE [dbo].[Excursion]
SET [ActualTouristQuantity] = 60000
WHERE [Id] = 2;