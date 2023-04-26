USE master
GO

CREATE LOGIN dbm_login WITH PASSWORD = 'Black123!@#'; --密码和SA密码保持一致
CREATE USER dbm_user FOR LOGIN dbm_login;
GRANT VIEW SERVER STATE To dbm_login;
GRANT CREATE AVAILABILITY GROUP To dbm_login;
GRANT ALTER ANY AVAILABILITY GROUP To dbm_login;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Black123!@#';
go
CREATE CERTIFICATE dbm_certificate WITH SUBJECT = 'dbm';
BACKUP CERTIFICATE dbm_certificate
TO FILE = '/var/opt/mssql/dbm_certificate.cer' --此目录已经映射到宿主服务器，这样方便管理
WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/dbm_certificate.pvk',
        ENCRYPTION BY PASSWORD = 'Black123!@#'
    );
GO
