--Менеджер:

--Створення нових типів екскурсій та оновлення існуючих.
--Додавання нових автобусів до бази даних та призначення їх на конкретні екскурсії.
--Видалення неактуальних даних про екскурсії, автобуси, водіїв та клієнтів.

--Користувач з паролем
CREATE LOGIN Manager WITH PASSWORD = 'MyP@ssw0rd2023!';
GO

--новий користувач для логіну
CREATE USER Manager FOR LOGIN Manager;
GO

--Привілеї
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Driver] TO Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[ExcursionType] TO Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus] TO Manager;
GO


--Для комфорту користування ще для процедур і exec
GRANT CREATE PROCEDURE TO Manager;
GRANT EXECUTE TO Manager;
GO



--Водій
--Перегляд інформації,тобто розклад який потрібен водію, точніше тривалість екскурсії,автобус та дата зайнятості

CREATE LOGIN DriverLogin WITH PASSWORD = 'MyP@ssw0rd2023!';
GO

CREATE USER Driver FOR LOGIN DriverLogin;
GO

GRANT SELECT ON [dbo].[Excursion] TO Driver;
GRANT SELECT ON [dbo].[Driver] TO Driver;
GRANT SELECT ON [dbo].[Bus_Driver_Excursion] TO Driver;


--Бухгалтер
--Створення нових даних щодо оплати(обліку оплати),чеку та нових клієнтів
--Оновлення інформації щодо таблиць ,які пов'язані з оплатою та клієнтами
--Видалення даних щодо вище зазначених таблиць
CREATE LOGIN AccountantLogin WITH PASSWORD ='MyP@ssw0rd2023!';
GO

CREATE USER Accountant FOR LOGIN AccountantLogin;
GO


GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[PaymentAccounting] TO Accountant;
GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[Receipt] TO Accountant;
GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[Client] TO Accountant;





--Ролі 

--Адміністратор
CREATE ROLE Administrator;
GO


GRANT SELECT , INSERT ,UPDATE ,DELETE TO Administrator;


--старший бухгалтер
CREATE ROLE Senior_Accountant;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Receipt] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[PaymentAccounting] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Client] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Excursion] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus_Driver] TO [Senior_Accountant];



--надання користувачу привілеї 
ALTER ROLE [Senior_Accountant] ADD MEMBER [Accountant];

--видалення привілеї у користувача ,яка також є у ролі
REVOKE SELECT ON [dbo].[Client] TO [Accountant]

--перевірка  чи буде працювати запит з роллю
SELECT * FROM Client

--Забирання ролі у користувача
ALTER ROLE [Senior_Accountant] DROP MEMBER [Accountant];

--перевірка  чи буде працювати запит без ролі
SELECT * FROM Client

--Видалення ролі адміністратора 
DROP ROLE [Administrator];

--видалення користувача
DROP USER [Accountant];










