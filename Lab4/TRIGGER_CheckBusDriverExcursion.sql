CREATE OR ALTER TRIGGER CheckBusDriverExcursion
ON dbo.Bus_Driver_Excursion
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BusId INT, @DriverId INT, @ExcursionId INT;

    SELECT @BusId = inserted.BusId, @DriverId = inserted.DriverId, @ExcursionId = inserted.ExcursionId
    FROM inserted;

    IF EXISTS (
        SELECT 1
        FROM dbo.Bus_Driver_Excursion bde
        INNER JOIN dbo.Excursion e ON e.Id = bde.ExcursionId
        WHERE bde.BusId = @BusId AND bde.DriverId = @DriverId AND e.Id <> @ExcursionId
    )

    BEGIN
        RAISERROR ('The bus and driver are already assigned to another excursion.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO


-- Update data to trigger the CheckBusDriverExcursion trigger
UPDATE [dbo].[Bus_Driver_Excursion]
SET [DriverId] = 4
WHERE [Bus_Driver_Excursion] = 1;

