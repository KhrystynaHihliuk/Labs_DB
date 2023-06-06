USE LAB1;

INSERT INTO [Driver] (Id,name)
VALUES
  (1,'Pamela Trujillo'),
  (2,'Harding Dean'),
  (3,'Lucius Meyer'),
  (4,'Thaddeus Adams'),
  (5,'Sarah Wyatt');

  INSERT INTO [dbo].[ExcursionType] (Id, Name, Duration, Destination, TouristQuantity, Distance) 
  VALUES
(1, 'Beach', 2, 'Miami', 50, 100),
(2, 'Hiking', 3, 'Yellowstone', 25, 200),
(3, 'City Tour', 1, 'New York', 30, 50),
(4, 'Historical Tour', 5, 'Washington D.C.', 40, 30),
(5, 'Winery Tour', 7, 'Napa Valley', 30, 70);

INSERT INTO [dbo].[Bus] ([Id], [ExcursionType], [PassengerQuantity], [GasConsumption]) 
VALUES
(1, 1, 40, '10L/100km'),
(2, 2, 15, '15L/100km'),
(3, 3, 80, '8L/100km'),
(4, 4, 35, '12L/100km'),
(5, 5, 25, '18L/100km');

INSERT INTO [dbo].[Bus_Excursion] ([BusId], [ExcursionType]) 
VALUES
(1, 3),
(2, 5),
(3, 4),
(4, 1),
(5, 2);

INSERT INTO [dbo].[Bus_Driver] ([DriverId], [BusId], [Date]) VALUES
(1, 3, '2023-04-05'),
(2, 4, '2023-04-06'),
(3, 5, '2023-04-07'),
(4, 2, '2023-04-08'),
(5, 1, '2023-04-09');

INSERT INTO [dbo].[Client] ([Id], [Name], [Surname], [AmountOwed]) VALUES
(1, 'John', 'Doe', 100),
(2, 'Jane', 'Smith', 50),
(3, 'Bob', 'Johnson', 200),
(4, 'Alice', 'Williams', 75),
(5, 'Mike', 'Davis', 0);

INSERT INTO [dbo].[Excursion] ([Id], [Date], [ExcursionType], [ActualTouristQuantity], [Client]) VALUES
(1, '2023-04-10', 1, 20, 1),
(2, '2023-04-11', 2, 10, 2),
(3, '2023-04-12', 3, 60, 3),
(4, '2023-04-13', 4, 4, 4),
(5, '2023-04-14', 5, 25, 5);

INSERT INTO [dbo].[Receipt] ([ReceiptId], [DateOfAccrual], [Sum]) VALUES
(1, '2023-04-10', 100),
(2, '2023-04-11', 50),
(3, '2023-04-12', 200),
(4, '2023-04-13', 75),
(5, '2023-04-14', 1500);


INSERT INTO [dbo].[Bus_Driver_Excursion] ([Bus_Driver_Excursion],[DriverId], [BusId], [ExcursionId]) VALUES
(1, 1, 3, 5),
(2, 2, 4, 4),
(3, 3, 5, 2),
(4, 4, 2, 3),
(5, 5, 1, 1);

INSERT INTO [dbo].[Client_Excursion] ([Client_ExcursionId], [ClientId], [ExcursionId])
VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 2),
(4, 4, 3),
(5, 5, 3);

INSERT INTO [dbo].[PaymentAccounting] ([Id], [ClientId], [AmountPaid], [PaymentDate])
VALUES
(1, 1, 100, '2023-01-01'),
(2, 3, 150, '2023-02-05'),
(3, 4, 75, '2023-02-28'),
(4, 2, 200, '2023-03-15'),
(5, 5, 50, '2023-03-25');