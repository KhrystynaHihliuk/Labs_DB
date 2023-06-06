USE LAB1;

--SELECT на баз≥ одн≥Їњ таблиц≥ з використанн€м сортуванн€, накладенн€м умов з≥ звТ€зками OR та AND.

SELECT *
FROM [dbo].[Client]
WHERE [AmountOwed] > 75 AND ([Name] = 'John' OR [Surname] = 'Johnson')
ORDER BY [Surname] ASC;

--ЈSELECT з виводом обчислюваних пол≥в (вираз≥в) в колонках результату.

SELECT Id,Name,Destination,TouristQuantity-1 AS tourist_quantity_without_tourguide  , (Duration/60.0) AS duration_hours
FROM [dbo].[ExcursionType]
WHERE [Id] = 3
ORDER BY [Id] ASC; 

--Х	SELECT на баз≥ к≥лькох таблиць з використанн€м сортуванн€, накладенн€м умов з≥ звТ€зками OR та AND.
SELECT *
FROM [dbo].[Excursion],[dbo].[Client]
WHERE Client.Id=Excursion.Client AND (Client.Name='John' OR Client.Surname='Smith')

--Х	SELECT на баз≥ к≥лькох таблиць з типом поЇднанн€ Outer Join.
SELECT * 
FROM [dbo].[Excursion]
FULL OUTER JOIN [dbo].[Client] on Client.Id=Excursion.Client

--Х	SELECT з використанн€м оператор≥в Like, Between, In, Exists, All, Any.
SELECT Duration,Distance,Destination
FROM [dbo].[ExcursionType] AS E
WHERE E.Duration BETWEEN 1 AND 5 
AND E.Destination LIKE 'M%'

--Х	SELECT з використанн€м п≥дсумовуванн€ та групуванн€!!!
SELECT ExcursionType,Name,Surname,COUNT(Client) AS NC
FROM Client,Excursion
WHERE Client.Id=Excursion.Client
GROUP BY Name,Surname,ExcursionType

--Х	SELECT з використанн€м п≥дсумовуванн€ та групуванн€.

SELECT Client.Id, Client.Name, Client.Surname, COUNT(Client.Id) AS 'Client Count', SUM(Client.AmountOwed) AS 'Total Amount Owed'
FROM Client
JOIN Client_Excursion ON Client.Id = Client_Excursion.ClientId
JOIN Excursion ON Client_Excursion.ExcursionId = Excursion.Id
GROUP BY Client.Id, Client.Name, Client.Surname;



--Х	SELECT з використанн€м п≥д-запит≥в в частин≥ Where.

SELECT Name, AmountOwed
FROM Client
WHERE AmountOwed > (SELECT AVG(AmountOwed) FROM Client);

SELECT *
FROM Excursion
WHERE ExcursionType IN (
	SELECT ExcursionType
	FROM Bus
	WHERE Id IN (
		SELECT Id
		FROM Bus_Driver_Excursion
		WHERE DriverId = 5
	)
)

--Х	SELECT з використанн€м п≥д-запит≥в в частин≥ From.

SELECT e.Id, e.Date, c.Name, c.Surname
FROM (
  SELECT Id, Date, Client
  FROM Excursion
  WHERE ExcursionType = (
    SELECT Id
    FROM ExcursionType
    WHERE Destination = 'Yellowstone'
  )
) e
INNER JOIN Client c ON e.Client = c.Id;

--Х	≥Їрарх≥чний SELECT запит.


--Х	SELECT запит типу CrossTab.
SELECT *
FROM (
  SELECT 
    c.Name + ' ' + c.Surname AS ClientName,
    MONTH(e.Date) AS Month,
    COUNT(ce.Client_ExcursionId) AS ExcursionCount
  FROM Client_Excursion ce
  INNER JOIN Client c ON ce.ClientId = c.Id
  INNER JOIN Excursion e ON ce.ExcursionId = e.Id
  GROUP BY c.Name + ' ' + c.Surname, MONTH(e.Date)
) AS ExcursionCounts
PIVOT (
  SUM(ExcursionCount)
  FOR Month IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
) AS PivotTable;


--Х	UPDATE на баз≥ одн≥Їњ таблиц≥.
UPDATE Driver
SET Driver.Name='Bohdan'
WHERE Driver.Id=2

--Х	UPDATE на баз≥ к≥лькох таблиць.
UPDATE Excursion
SET ActualTouristQuantity=1000
WHERE ExcursionType = (
		SELECT E.Id
		FROM ExcursionType E
		WHERE E.Id=4
)

--Х	Append (INSERT) дл€ додаванн€ запис≥в з €вно вказаними значенн€ми.

INSERT INTO Client (Id, Name, Surname, AmountOwed)
VALUES (12, 'Jane', 'Smit', 500),
       (25, 'Bob', 'Johnson', 2000),
       (7, 'Alice', 'Brown', 0);


--Х	Append (INSERT) дл€ додаванн€ запис≥в з ≥нших таблиць.

INSERT INTO Excursion(Id, Date,ExcursionType, ActualTouristQuantity,Client)
VALUES (
  8,
  '2023-05-21',
  1,
  (SELECT TOP 1 PassengerQuantity FROM Bus WHERE id = 5 ),
 4
);


--Х	DELETE дл€ видаленн€ вс≥х даних з таблиц≥.
DELETE FROM Receipt
--Х	DELETE дл€ видаленн€ вибраних запис≥в таблиц≥.
DELETE FROM PaymentAccounting WHERE ClientId = 1;