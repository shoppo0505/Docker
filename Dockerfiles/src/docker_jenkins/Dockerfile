FROM jenkins/jenkins:jdk17

USER root
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
#    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib >/etc/apt/sources.list && \
#    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch main non-free contrib >>/etc/apt/sources.list && \
#    echo deb  http://mirrors.ustc.edu.cn/debian-security stretch/updates main >>/etc/apt/sources.list && \
#    echo deb-src  http://mirrors.ustc.edu.cn/debian-security stretch/updates main >>/etc/apt/sources.list && \
#    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib >>/etc/apt/sources.list && \
#    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch-updates main non-free contrib >>/etc/apt/sources.list && \
#    echo deb  http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib >>/etc/apt/sources.list && \
#    echo deb-src  http://mirrors.ustc.edu.cn/debian/ stretch-backports main non-free contrib >>/etc/apt/sources.list && \
#    echo deb http://ftp.cn.debian.org/debian sid main >>/etc/apt/sources.list && \
#    echo deb http://ftp.cn.debian.org/debian buster main  >>/etc/apt/sources.list


    echo deb  http://mirrors.ustc.edu.cn/debian/ bullseye main >/etc/apt/sources.list && \
#    echo deb  http://mirrors.ustc.edu.cn/debian/ bullseye-security main >>/etc/apt/sources.list && \
    echo deb  http://mirrors.ustc.edu.cn/debian/ bullseye-updates main >>/etc/apt/sources.list
RUN apt-get update && apt-get -y install iptables openssh-server openssh-client expect

COPY sshd_config /etc/ssh/.
COPY ssh_config /etc/ssh/.
RUN service ssh start
RUN ssh-agent
RUN echo "root:root" | chpasswd
RUN echo "jenkins:jenkins" | chpasswd
COPY .bashrc /root/.
#CMD service ssh start
#CMD ssh-agent

USER jenkins
COPY jenkins_home.zip /var/.
COPY start.sh /var/.
COPY active.sh /var/.
COPY auto_ssh.sh /var/.

#RUN chmod 755 /app/jenkins_home/apache-maven-3.9.1/bin/*
#RUN chmod 700 /app/jenkins_home/.ssh/*
#RUN ls /var/jenkins_home/.ssh
#RUN cp /app/jenkins_home/.ssh/id* /var/jenkins_home/.ssh/.
#java -Duser.home=/app/jenkins_home -jar /usr/share/jenkins/jenkins.war
EXPOSE 22

#ENV JENKINS_HOME /app/jenkins_home
#ENTRYPOINT ["/usr/bin/tini", "/usr/local/bin/jenkins.sh"]
#ENTRYPOINT ["java", "-Duser.home=/var/jenkins_home", "-jar /usr/share/jenkins/jenkins.war"]
#ENTRYPOINT ["java", "-Duser.home=\"$JENKINS_HOME\"", "\"${java_opts_array[@]}\"", "-jar \"${JENKINS_WAR}\"' "\"${jenkins_opts_array[@]}\""
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT /var/start.sh
