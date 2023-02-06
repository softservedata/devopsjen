FROM alpine:latest

RUN apk update
RUN apk add openjdk11
RUN apk add maven
RUN apk add wget
RUN apk add ttf-dejavu
RUN apk add xvfb
RUN apk add git

WORKDIR /root/
RUN wget https://updates.jenkins.io/latest/jenkins.war

EXPOSE 8080
ENTRYPOINT ["java","-Djava.awt.headless=true","-jar","jenkins.war"]
