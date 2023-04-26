@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.cer .
@REM docker cp sqlNode1:/var/opt/mssql/dbm_certificate.pvk .
@REM docker cp dbm_certificate.cer sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode2:/var/opt/mssql/
@REM docker cp dbm_certificate.cer sqlNode3:/var/opt/mssql/
@REM docker cp dbm_certificate.pvk sqlNode3:/var/opt/mssql/

copy D:\dbs\1\data\testdb.mdf D:\dbs\2\data\testdb.mdf
copy D:\dbs\1\data\testdb_log.ldf D:\dbs\2\data\testdb_log.ldf
copy D:\dbs\1\data\testdb.mdf D:\dbs\3\data\testdb.mdf
copy D:\dbs\1\data\testdb_log.ldf D:\dbs\3\data\testdb_log.ldf
copy D:\dbs\1\data\testdb.bak D:\dbs\2\data\testdb.bak
copy D:\dbs\1\data\testdb.bak D:\dbs\3\data\testdb.bak
