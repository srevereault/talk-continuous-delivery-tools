FROM jenkins
USER root
RUN apt-get update && apt-get install --no-install-recommends -y maven
USER jenkins
COPY install_jenkins_plugins.sh /usr/local/bin/
COPY settings.xml /usr/share/maven/conf/
COPY plugins.txt /usr/share/jenkins/ref/
RUN cat /usr/share/jenkins/ref/plugins.txt | xargs /usr/local/bin/install_jenkins_plugins.sh 
