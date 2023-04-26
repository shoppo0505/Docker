--创建终结点,设为证书验证 这里第二行有1个CERT1要改
CREATE ENDPOINT [Hadr_endpoint] AUTHORIZATION [dbm_login] STATE=STARTED AS TCP (LISTENER_PORT = 5022, LISTENER_IP = ALL)
FOR DATA_MIRRORING (ROLE = ALL,AUTHENTICATION = CERTIFICATE CERT2, ENCRYPTION = REQUIRED ALGORITHM AES)
GO
ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;
-- GRANT CONNECT ON ENDPOINT::[Hadr_endpoint] TO [dbm_login];
GO
-- 启用开机自启动ALWAYON，在所有节点执行以下命令
ALTER EVENT SESSION  AlwaysOn_health ON SERVER WITH (STARTUP_STATE=ON);
ALTER EVENT SESSION [AlwaysOn_health] ON SERVER STATE=START;
GO
