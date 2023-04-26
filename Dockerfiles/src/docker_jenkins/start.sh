#!/bin/bash

# Program:
#       This program shows "jenkins server" in your backend.
# History:
# 2023-04-26 Zhengqing.Yang First release

sleep 30

#复制公钥，私钥，know_hosts文件到/var/jenkins_home/
mkdir /var/jenkins_home/.ssh | cp /app/jenkins_home/.ssh/* /var/jenkins_home/.ssh/.
java -Duser.home=/app/jenkins_home -jar /usr/share/jenkins/jenkins.war

exit 0
