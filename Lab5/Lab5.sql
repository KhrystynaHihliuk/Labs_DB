--��������:

--��������� ����� ���� �������� �� ��������� ��������.
--��������� ����� �������� �� ���� ����� �� ����������� �� �� �������� �������.
--��������� ������������ ����� ��� �������, ��������, ��䳿� �� �볺���.

--���������� � �������
CREATE LOGIN Manager WITH PASSWORD = 'MyP@ssw0rd2023!';
GO

--����� ���������� ��� �����
CREATE USER Manager FOR LOGIN Manager;
GO

--������
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Driver] TO Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[ExcursionType] TO Manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus] TO Manager;
GO


--��� �������� ������������ �� ��� �������� � exec
GRANT CREATE PROCEDURE TO Manager;
GRANT EXECUTE TO Manager;
GO



--����
--�������� ����������,����� ������� ���� ������� ����, ������ ��������� �������,������� �� ���� ���������

CREATE LOGIN DriverLogin WITH PASSWORD = 'MyP@ssw0rd2023!';
GO

CREATE USER Driver FOR LOGIN DriverLogin;
GO

GRANT SELECT ON [dbo].[Excursion] TO Driver;
GRANT SELECT ON [dbo].[Driver] TO Driver;
GRANT SELECT ON [dbo].[Bus_Driver_Excursion] TO Driver;


--���������
--��������� ����� ����� ���� ������(����� ������),���� �� ����� �볺���
--��������� ���������� ���� ������� ,�� ���'���� � ������� �� �볺�����
--��������� ����� ���� ���� ���������� �������
CREATE LOGIN AccountantLogin WITH PASSWORD ='MyP@ssw0rd2023!';
GO

CREATE USER Accountant FOR LOGIN AccountantLogin;
GO


GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[PaymentAccounting] TO Accountant;
GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[Receipt] TO Accountant;
GRANT SELECT , UPDATE , INSERT , DELETE ON [dbo].[Client] TO Accountant;





--��� 

--�����������
CREATE ROLE Administrator;
GO


GRANT SELECT , INSERT ,UPDATE ,DELETE TO Administrator;


--������� ���������
CREATE ROLE Senior_Accountant;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Receipt] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[PaymentAccounting] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Client] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Excursion] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus] TO [Senior_Accountant];
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Bus_Driver] TO [Senior_Accountant];



--������� ����������� ������ 
ALTER ROLE [Senior_Accountant] ADD MEMBER [Accountant];

--��������� ������ � ����������� ,��� ����� � � ���
REVOKE SELECT ON [dbo].[Client] TO [Accountant]

--��������  �� ���� ��������� ����� � �����
SELECT * FROM Client

--��������� ��� � �����������
ALTER ROLE [Senior_Accountant] DROP MEMBER [Accountant];

--��������  �� ���� ��������� ����� ��� ���
SELECT * FROM Client

--��������� ��� ������������ 
DROP ROLE [Administrator];

--��������� �����������
DROP USER [Accountant];










