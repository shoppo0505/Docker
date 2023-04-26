#step 0: clean up database files
#step 1: 使用docker-compose.yml创建数据库实例
#step 2: 在各个节点db,建立管理用户及密钥文件
#step 3: 在辅节点导入刚才复制过来的认证文件（每个辅节点分别执行）
#step 4: 使用复制的文件创建密钥
#step 5: 创建终结点,设为证书验证
#step 6: 主数据库中创建测试数据库
#step 7: 创建AG组
#step 8: 连接副节点到AG组
