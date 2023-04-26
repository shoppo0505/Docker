USE [master]
GO
CREATE DATABASE [testdb] ON
( FILENAME = N'/var/opt/mssql/data/testdb.mdf' ),
( FILENAME = N'/var/opt/mssql/data/testdb_log.ldf' )
 FOR ATTACH
GO
RESTORE DATABASE [testdb] FILE = N'testdb' FROM  DISK = N'/var/opt/mssql/data/testdb.bak'
WITH MOVE 'testdb' TO '/var/opt/mssql/data/testdb.mdf',
MOVE 'testdb_log' TO '/var/opt/mssql/data/testdb_log.ldf',
FILE = 1, NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 10
GO
ALTER AVAILABILITY GROUP [AG1] JOIN WITH (CLUSTER_TYPE = NONE);
ALTER AVAILABILITY GROUP [AG1] GRANT CREATE ANY DATABASE;
GO
