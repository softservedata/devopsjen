#!/bin/bash

#git clone https://github.com/softservedata/devopsjen.git

cd devopsjen
java -jar jenkins-plugin-manager-2.12.11.jar --war jenkins.war --plugin-file plugins.txt --plugin-download-directory data/.jenkins/plugins
docker build -t alpinejenkins .

#docker run --rm --detach --name jenkins_server -p 8080:8080 alpinejenkins
