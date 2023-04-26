@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.cer .
@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.pvk .
@REM docker cp dbm_certificate.cer sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.cer sqlNode3:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode3:/var/opt/mssql/

del D:\dbs\1\*.cer
del D:\dbs\2\*.cer
del D:\dbs\3\*.cer

rmdir /q /s D:\dbs\1\data
rmdir /q /s D:\dbs\2\data
rmdir /q /s D:\dbs\3\data
