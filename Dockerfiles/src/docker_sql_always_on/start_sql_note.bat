docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Black123!@#" -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest

@REM /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Black123!@#' -i files/config_cluster1.sql
docker exec -it sqlNode1 /opt/mssql/bin/mssql-conf  set hadr.hadrenabled  1
sudo systemctl restart mssql-server


docker exec -it sqlNode1 /bin/bash

docker exec -it sqlNode1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Black123!@#'

/opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
set-sa-password

cat /var/opt/mssql/mssql-conf
