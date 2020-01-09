FROM tomcat:8.5.6-jre8-alpine
MAINTAINER Vishnu
COPY target/hello-world-0.0.1.war /usr/local/tomcat/webapps/hello-world.war
