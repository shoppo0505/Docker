CREATE DATABASE testdb;
GO
USE testdb;
GO
ALTER DATABASE testdb SET RECOVERY FULL;
GO
CREATE TABLE NEWTABLE(id int, name nvarchar(10));
GO
INSERT INTO NEWTABLE
SELECT 1, 'name1' UNION ALL
SELECT 2, 'name2'
    GO
BACKUP DATABASE testdb TO DISK = '/var/opt/mssql/data/testdb.bak';
GO
USE [testdb]
GO
CREATE USER [dbm_login] FOR LOGIN [dbm_login]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbm_login]
GO
USE [master]
GO
ALTER DATABASE [testdb] SET  OFFLINE
GO
