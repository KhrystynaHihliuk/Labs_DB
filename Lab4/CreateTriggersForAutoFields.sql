ALTER TABLE Excursion ADD UCR VARCHAR(255);
ALTER TABLE Excursion ADD DCR DATETIME;
ALTER TABLE Excursion ADD ULC VARCHAR(255);
ALTER TABLE Excursion ADD DLC DATETIME;
GO

CREATE TRIGGER UpdateExcursionAuditFields
ON Excursion
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE E
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM Excursion E
    INNER JOIN inserted I ON E.Id = I.Id;
END;

ALTER TABLE ExcursionType ADD UCR VARCHAR(255);
ALTER TABLE ExcursionType ADD DCR DATETIME;
ALTER TABLE ExcursionType ADD ULC VARCHAR(255);
ALTER TABLE ExcursionType ADD DLC DATETIME;
GO

Go
CREATE TRIGGER UpdateExcursionTypeAuditFields
ON ExcursionType
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE E
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM ExcursionType E
    INNER JOIN inserted I ON E.Id= I.Id;
END;


ALTER TABLE Bus ADD UCR VARCHAR(255);
ALTER TABLE Bus ADD DCR DATETIME;
ALTER TABLE Bus ADD ULC VARCHAR(255);
ALTER TABLE Bus ADD DLC DATETIME;
GO

Go
CREATE TRIGGER UpdateBusAuditFields
ON Bus
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE B
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM Bus B
    INNER JOIN inserted I ON B.Id = I.Id;
END;

ALTER TABLE Driver ADD UCR VARCHAR(255);
ALTER TABLE Driver ADD DCR DATETIME;
ALTER TABLE Driver ADD ULC VARCHAR(255);
ALTER TABLE Driver ADD DLC DATETIME;
GO

Go
CREATE TRIGGER UpdateDriverAuditFields
ON Driver
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE D
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM Driver D
    INNER JOIN inserted I ON D.Id = I.Id;
END;

ALTER TABLE Client ADD UCR VARCHAR(255);
ALTER TABLE Client ADD DCR DATETIME;
ALTER TABLE Client ADD ULC VARCHAR(255);
ALTER TABLE Client ADD DLC DATETIME;
GO

Go
CREATE TRIGGER UpdateClientAuditFields
ON Client
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE C
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM Client C
    INNER JOIN inserted I ON C.Id = I.Id;
END;

ALTER TABLE PaymentAccounting ADD UCR VARCHAR(255);
ALTER TABLE PaymentAccounting ADD DCR DATETIME;
ALTER TABLE PaymentAccounting ADD ULC VARCHAR(255);
ALTER TABLE PaymentAccounting ADD DLC DATETIME;
GO

Go
CREATE TRIGGER UpdatePaymentAccountingAuditFields
ON PaymentAccounting
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE P
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM PaymentAccounting P
    INNER JOIN inserted I ON P.Id = I.Id;
END;

ALTER TABLE Receipt ADD UCR VARCHAR(255);
ALTER TABLE Receipt ADD DCR DATETIME;
ALTER TABLE Receipt ADD ULC VARCHAR(255);
ALTER TABLE Receipt ADD DLC DATETIME;
GO

Go
CREATE OR ALTER TRIGGER UpdateReceiptAuditFields
ON Receipt
AFTER INSERT, UPDATE
AS
BEGIN
    -- Оновлення полів UCR, DCR, ULC, DLC для нових записів
    UPDATE R
    SET UCR = SYSTEM_USER,
        DCR = GETDATE(),
        ULC = SYSTEM_USER,
        DLC = GETDATE()
    FROM Receipt R
    INNER JOIN inserted I ON R.ReceiptId = I.ReceiptId;
END;
