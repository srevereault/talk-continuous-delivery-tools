FROM jenkins
USER root
RUN apt-get update && apt-get install --no-install-recommends -y maven
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
COPY settings.xml /usr/share/maven/conf/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
