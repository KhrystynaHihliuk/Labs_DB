USE LAB1;

DROP TABLE IF EXISTS [dbo].[Client]
Go
CREATE TABLE [dbo].[Client](
    [Id] INT NOT NULL PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[Surname] VARCHAR(50) NOT NULL,
	[AmountOwed] INT NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[Driver]
Go
CREATE TABLE [dbo].[Driver](
	[Id] INT NOT NULL PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[ExcursionType]
Go
CREATE TABLE [dbo].[ExcursionType](
    [Id] INT NOT NULL PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[Duration] INT NOT NULL,
	[Destination] VARCHAR(50) NOT NULL,
	[TouristQuantity] INT NOT NULL,
	[Distance] INT NOT NULL
);
Go

DROP TABLE IF EXISTS [dbo].[Bus]
Go
CREATE TABLE [dbo].[Bus](
    [Id] INT NOT NULL PRIMARY KEY,
	[ExcursionType] INT NOT NULL,
	[PassengerQuantity] INT NOT NULL,
	[GasConsumption] VARCHAR(50) NOT NULL,
	FOREIGN KEY(ExcursionType) REFERENCES ExcursionType(Id)
);
Go

DROP TABLE IF EXISTS [dbo].[Bus_Driver]
Go
CREATE TABLE [dbo].[Bus_Driver](
    [DriverId] INT NOT NULL ,
	[BusId] INT NOT NULL ,
	[Date] DATE NOT NULL,
	FOREIGN KEY(DriverId) REFERENCES Driver(Id),
	FOREIGN KEY(BusId) REFERENCES Bus(Id)
);
Go

DROP TABLE IF EXISTS [dbo].[Bus_Excursion]
Go
CREATE TABLE [dbo].[Bus_Excursion](
	[BusId] INT NOT NULL ,
	[ExcursionType] INT NOT NULL,
	FOREIGN KEY(BusId) REFERENCES Bus(Id),
	FOREIGN KEY(ExcursionType) REFERENCES ExcursionType(Id)
);
Go

DROP TABLE IF EXISTS [dbo].[Excursion]
Go
CREATE TABLE [dbo].[Excursion](
	[Id] INT NOT NULL PRIMARY KEY,
	[Date] DATE NOT NULL,
	[ExcursionType] INT NOT NULL,
	[ActualTouristQuantity] INT NOT NULL,
	[Client] INT NOT NULL,
	FOREIGN KEY(ExcursionType) REFERENCES ExcursionType(Id),
	FOREIGN KEY(Client) REFERENCES Client(Id)
);
Go


DROP TABLE IF EXISTS [dbo].[Receipt]
Go
CREATE TABLE [dbo].[Receipt](
    [ReceiptId] INT NOT NULL PRIMARY KEY,
	[DateOfAccrual] DATE NOT NULL,
	[Sum] INT NOT NULL,
);
Go

DROP TABLE IF EXISTS [dbo].[Client_Excursion]
Go
CREATE TABLE [dbo].[Client_Excursion](
	[Client_ExcursionId] INT NOT NULL PRIMARY KEY,
	[ClientId] INT NOT NULL,
	[ExcursionId] INT NOT NULL,
	FOREIGN KEY(ClientId) REFERENCES Client(Id),
	FOREIGN KEY(ExcursionId) REFERENCES Excursion(Id)
);
Go

DROP TABLE IF EXISTS [dbo].[PaymentAccounting]
Go
CREATE TABLE [dbo].[PaymentAccounting](
	[Id] INT NOT NULL PRIMARY KEY,
    [ClientId] INT NOT NULL,
	[AmountPaid] INT NOT NULL,
	[PaymentDate] DATE NOT NULL,
	FOREIGN KEY(ClientId) REFERENCES Client(Id)
);
Go

DROP TABLE IF EXISTS [dbo].[Bus_Driver_Excursion]
Go
CREATE TABLE [dbo].[Bus_Driver_Excursion](
	[Bus_Driver_Excursion] INT NOT NULL PRIMARY KEY,
    [DriverId] INT NOT NULL ,
	[BusId] INT NOT NULL ,
    [ExcursionId] INT NOT NULL,
	FOREIGN KEY(DriverId) REFERENCES Driver(Id),
	FOREIGN KEY(BusId) REFERENCES Bus(Id),
	FOREIGN KEY(ExcursionId) REFERENCES Excursion(Id)
);
Go

ALTER TABLE [dbo].[Client] 
ALTER COLUMN [AmountOwed] INT NULL;

ALTER TABLE [dbo].[Bus] 
ALTER COLUMN [GasConsumption] INT NOT NULL;

 IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'PaymentAmount' AND object_id = OBJECT_ID('Client'))
    BEGIN
        ALTER TABLE Client ADD PaymentAmount INT;
    END;