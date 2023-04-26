CREATE LOGIN dbm_login WITH PASSWORD = 'Black123!@#';
CREATE USER dbm_user FOR LOGIN dbm_login;
-- https://blog.51cto.com/u_15082391/3888879
GRANT VIEW SERVER STATE To dbm_login;
GRANT CREATE AVAILABILITY GROUP To dbm_login;
GRANT ALTER ANY AVAILABILITY GROUP To dbm_login;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Black123!@#';
GO
CREATE CERTIFICATE dbm_certificate
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/dbm_certificate.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/dbm_certificate.pvk',
        DECRYPTION BY PASSWORD = 'Black123!@#'
        );
GO
