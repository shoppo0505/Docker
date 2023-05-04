#!/bin/bash

# Program:
#       This program shows "jenkins server" in your backend.
# History:
# 2023-04-26 Xiaobo First release

sleep 5

# login with root, start service: service ssh start and ssh-agent
./var/active.sh

#复制公钥，私钥，know_hosts文件到/var/jenkins_home/
unzip /var/jenkins_home.zip -d /var/jenkins_home
chmod 755 /var/jenkins_home/apache-maven-3.9.1/bin/*
chmod 700 /var/jenkins_home/.ssh/*
# 启动ssh, 发送 id_rsa.pub 到salver节点
./var/auto_ssh.sh jenkins jenkins 172.19.0.3
./var/auto_ssh.sh jenkins jenkins 172.19.0.4

java -Duser.home=/var/jenkins_home -jar /usr/share/jenkins/jenkins.war

exit 0
