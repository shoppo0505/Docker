@REM step 0: clean up database files
del D:\dbs\1\*.cer
del D:\dbs\1\*.pvk
del D:\dbs\2\*.cer
del D:\dbs\2\*.pvk
del D:\dbs\3\*.cer
del D:\dbs\3\*.pvk

rmdir /q /s D:\dbs\1\data
rmdir /q /s D:\dbs\2\data
rmdir /q /s D:\dbs\3\data

@REM step 1: 使用docker-compose.yml创建数据库实例
docker-compose -f docker-compose.yml up -d
timeout /t 25
@REM step 2: 在主数据库,建立管理用户及密钥文件
sqlcmd.exe -S localhost,1501 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster1.sql
@REM step 3: 在辅节点导入刚才复制过来的认证文件(每个辅节点分别执行)
copy D:\dbs\1\dbm_certificate.cer D:\dbs\2\dbm_certificate.cer
copy D:\dbs\1\dbm_certificate.cer D:\dbs\3\dbm_certificate.cer
copy D:\dbs\1\dbm_certificate.pvk D:\dbs\2\dbm_certificate.pvk
copy D:\dbs\1\dbm_certificate.pvk D:\dbs\3\dbm_certificate.pvk
@REM step 4: 使用复制的文件创建密钥
sqlcmd.exe -S localhost,1502 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster3.sql
sqlcmd.exe -S localhost,1503 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster3.sql
@REM step 5: 创建终结点,设为证书验证
sqlcmd.exe -S localhost,1501 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster4.sql
sqlcmd.exe -S localhost,1502 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster4.sql
sqlcmd.exe -S localhost,1503 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster4.sql
@REM step 6: 主数据库中创建测试数据库
sqlcmd.exe -S localhost,1501 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster5.sql
@REM step 7: 复制主数据库文件到副节点
copy D:\dbs\1\data\testdb.mdf D:\dbs\2\data\testdb.mdf
copy D:\dbs\1\data\testdb_log.ldf D:\dbs\2\data\testdb_log.ldf
copy D:\dbs\1\data\testdb.mdf D:\dbs\3\data\testdb.mdf
copy D:\dbs\1\data\testdb_log.ldf D:\dbs\3\data\testdb_log.ldf
copy D:\dbs\1\data\testdb.bak D:\dbs\2\data\testdb.bak
copy D:\dbs\1\data\testdb.bak D:\dbs\3\data\testdb.bak
@REM step 8: 联机数据库，创建AG组
sqlcmd.exe -S localhost,1501 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster7.sql
@REM step 8: 联机数据库，连接副节点到AG组
sqlcmd.exe -S localhost,1502 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster8.sql
sqlcmd.exe -S localhost,1503 -U sa -P Black123!@# -d master -i D:\Git\Docker\Dockerfiles\src\docker_sql_cluster\sql_cluster_on_dbm\config_cluster8.sql


