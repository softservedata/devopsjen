pipeline {
    agent any

    environment {
        APP_PORT=9090
    }

    stages {
        
        stage('Build') {
            steps {
                echo "START Build Jobname=$JOB_NAME"
                sh 'mvn -B package -DskipTests'
            }
        }

        stage('Integration Test') {
            steps {
                script {
                    echo "START Application Direcrory name = ${env.JOB_NAME}"
                    sh 'java -jar target/contact.war & echo $! > pid.file | echo "start test" ; cat pid.file'
                    //'''
                    //sh -c 'java -jar target/contact.war & echo $! > pid.file' | sh -c 'echo "start test" ; mvn failsafe:integration-test ; echo -n "***kill process #" ; cat pid.file; kill -9 $(cat pid.file) ; rm -rf pid.file ; echo "done"'
                }
            }
        }        
        
    }
}
