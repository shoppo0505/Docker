1. 基于alpine镜像，安装所需要的插件
启动镜像的时候，需要添加参数 --privileged --network my-network --ip 172.18.0.2
--privileged： 给容器添加root权限，否则启动docker进程的时候会出现权限问题。
--network my-network --ip 172.18.0.2：容器启动是使用固定IP

2. 安装docker, docker-compose
启动docker： dockerd --storage-driver fuse-overlayfs
启动时候使用fuse-overlayfs驱动，驱动已经安装。

3.修改harbor.yml配置文件
  a) hostname：修改为当前机器ip地址
  b) 如果不需要https，则注释12-18行
  c) 可以根据需要修改harbor_admin_password

4.修改docker的daemon.json配置文件，添加
"insecure-registries": [
    "172.18.0.2"
  ]

5. 执行 install.sh启动harbor

6. 添加新账户
   shoppo
7. 命令行登录账户
   docker login 172.18.0.2 -u shoppo --password Shoppo0505

8. 上传镜像
docker tag goharbor/harbor-jobservice:v2.8.2 172.18.0.2/library/harbor-jobservice:v2.8.2
docker push 172.18.0.2/library/harbor-jobservice:v2.8.2
