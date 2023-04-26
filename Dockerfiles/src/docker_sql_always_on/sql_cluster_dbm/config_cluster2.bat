@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.cer .
@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.pvk .
@REM docker cp dbm_certificate.cer sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.cer sqlNode3:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode3:/var/opt/mssql/

copy D:\dbs\1\dbm_certificate.cer D:\dbs\2\dbm_certificate.cer
copy D:\dbs\1\dbm_certificate.cer D:\dbs\3\dbm_certificate.cer
copy D:\dbs\1\dbm_certificate.pvk D:\dbs\2\dbm_certificate.pvk
copy D:\dbs\1\dbm_certificate.pvk D:\dbs\3\dbm_certificate.pvk
