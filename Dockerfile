FROM alpine:latest

WORKDIR /root/
RUN apk update && apk add openjdk11 && apk add maven && apk add git && apk add ttf-dejavu && apk add xvfb && mkdir .jenkins

COPY jenkins.war ./.jenkins ./.jenkins/

EXPOSE 8080
ENTRYPOINT ["java","-Djava.awt.headless=true","-jar","jenkins.war"]
