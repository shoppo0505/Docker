FROM jenkins/jenkins:jdk17
#ENV APP_ROOT="/app/"
#WORKDIR ${APP_ROOT}

#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
#ENV JENKINS_USER admin
#ENV JENKINS_PASS admin
#env https_proxy "http://10.158.100.9:8080"
#env http_proxy "http://10.158.100.9:8080"
#ENV JENKINS_UC = https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates
#ENV JENKINS_UC=https://updates.jenkins.io
#ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
#ENV JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals

USER root
#USER jenkins
#COPY plugins.txt /usr/share/jenkins/plugins.txt
#CMD jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
RUN mkdir -p /app/jenkins_home
RUN chmod 777 /app/jenkins_home
#RUN mkdir -p /var/jenkins_home/.ssh
#RUN chmod 777 /var/jenkins_home/.ssh

USER jenkins
COPY jenkins_home.zip /app/.
COPY start.sh /app/.
RUN unzip /app/jenkins_home.zip -d /app/jenkins_home
#RUN unzip /var/jenkins_home.zip -d /var/jenkins_home
#COPY jenkins_home /var/jenkins_home

RUN chmod 755 /app/jenkins_home/apache-maven-3.9.1/bin/*
RUN chmod 700 /app/jenkins_home/.ssh/*
#RUN ls /var/jenkins_home/.ssh
#RUN cp /app/jenkins_home/.ssh/id* /var/jenkins_home/.ssh/.
#java -Duser.home=/app/jenkins_home -jar /usr/share/jenkins/jenkins.war


ENV JENKINS_HOME /app/jenkins_home
#ENTRYPOINT ["/usr/bin/tini", "/usr/local/bin/jenkins.sh"]
#ENTRYPOINT ["java", "-Duser.home=/var/jenkins_home", "-jar /usr/share/jenkins/jenkins.war"]
#ENTRYPOINT ["java", "-Duser.home=\"$JENKINS_HOME\"", "\"${java_opts_array[@]}\"", "-jar \"${JENKINS_WAR}\"' "\"${jenkins_opts_array[@]}\""
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT /app/start.sh
#CMD ["java", "-Duser.home=/var/jenkins_home", "-jar /usr/share/jenkins/jenkins.war"]
