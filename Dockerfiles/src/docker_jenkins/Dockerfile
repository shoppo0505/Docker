FROM jenkins/jenkins:jdk17

USER jenkins
COPY jenkins_home.zip /var/.
COPY start.sh /var/.

#RUN chmod 755 /app/jenkins_home/apache-maven-3.9.1/bin/*
#RUN chmod 700 /app/jenkins_home/.ssh/*
#RUN ls /var/jenkins_home/.ssh
#RUN cp /app/jenkins_home/.ssh/id* /var/jenkins_home/.ssh/.
#java -Duser.home=/app/jenkins_home -jar /usr/share/jenkins/jenkins.war


#ENV JENKINS_HOME /app/jenkins_home
#ENTRYPOINT ["/usr/bin/tini", "/usr/local/bin/jenkins.sh"]
#ENTRYPOINT ["java", "-Duser.home=/var/jenkins_home", "-jar /usr/share/jenkins/jenkins.war"]
#ENTRYPOINT ["java", "-Duser.home=\"$JENKINS_HOME\"", "\"${java_opts_array[@]}\"", "-jar \"${JENKINS_WAR}\"' "\"${jenkins_opts_array[@]}\""
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT /var/start.sh
