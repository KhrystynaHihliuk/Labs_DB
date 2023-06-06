CREATE PROCEDURE [dbo].[CalculatePaymentForClient]
    @ClientId INT,
    @Year INT,
    @Month INT
AS
BEGIN
    DECLARE @TotalPayment INT = 0;

    SELECT @TotalPayment = SUM(E.ActualTouristQuantity * B.GasConsumption * ET.Duration)
    FROM [dbo].[Excursion] E
    INNER JOIN [dbo].[ExcursionType] ET ON ET.Id = E.ExcursionType
    INNER JOIN [dbo].[Bus_Excursion] BE ON BE.ExcursionType = ET.Id
    INNER JOIN [dbo].[Bus] B ON B.Id = BE.BusId
    WHERE E.Client = @ClientId AND YEAR(E.Date) = @Year AND MONTH(E.Date) = @Month;

    UPDATE [dbo].[Client]
    SET PaymentAmount = AmountOwed + @TotalPayment
    WHERE Id = @ClientId;
END;
GO

CREATE PROCEDURE [dbo].[CalculatePaymentForAllClients]
    @Year INT,
    @Month INT
AS
BEGIN
    DECLARE @ClientId INT;

    DECLARE ClientCursor CURSOR FOR 
    SELECT Id FROM [dbo].[Client];
    OPEN ClientCursor;

    FETCH NEXT FROM ClientCursor INTO @ClientId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC [dbo].[CalculatePaymentForClient] @ClientId, @Year, @Month;
        FETCH NEXT FROM ClientCursor INTO @ClientId;
    END;

    CLOSE ClientCursor;
    DEALLOCATE ClientCursor;
END;
GO


DECLARE @clientId INT = 1;
DECLARE @month INT =4;
DECLARE @year INT =2023;

EXECUTE dbo.CalculatePaymentForClient  @clientId, @year, @month
EXECUTE dbo.CalculatePaymentForAllClients @year,@month;
