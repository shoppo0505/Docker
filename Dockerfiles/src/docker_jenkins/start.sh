#!/bin/bash

# Program:
#       This program shows "jenkins server" in your backend.
# History:
# 2023-04-26 Xiaobo First release

sleep 30

#复制公钥，私钥，know_hosts文件到/var/jenkins_home/

unzip /var/jenkins_home.zip -d /var/jenkins_home
chmod 755 /var/jenkins_home/apache-maven-3.9.1/bin/*
chmod 700 /var/jenkins_home/.ssh/*
#mkdir /var/jenkins_home/.ssh | cp /app/jenkins_home/.ssh/* /var/jenkins_home/.ssh/.
java -Duser.home=/var/jenkins_home -jar /usr/share/jenkins/jenkins.war

exit 0
