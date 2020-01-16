FROM tomcat:8.5.6-jre8-alpine
MAINTAINER Vishnu
ARG APPVERSION
COPY target/hello-world-${APPVERSION}.war /usr/local/tomcat/webapps/helloworld.war
