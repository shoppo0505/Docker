@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.cer .
@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.pvk .
@REM docker cp dbm_certificate.cer sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.cer sqlNode3:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode3:/var/opt/mssql/

copy D:\dbs\1\CERT1.cer D:\dbs\2\CERT1.cer
copy D:\dbs\1\CERT1.cer D:\dbs\3\CERT1.cer
copy D:\dbs\2\CERT2.cer D:\dbs\1\CERT2.cer
copy D:\dbs\2\CERT2.cer D:\dbs\3\CERT2.cer
copy D:\dbs\3\CERT3.cer D:\dbs\1\CERT3.cer
copy D:\dbs\3\CERT3.cer D:\dbs\2\CERT3.cer
