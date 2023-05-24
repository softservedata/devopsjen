pipeline {
    agent any

    environment {
        APP_PORT=9090
        APP_DIR="${env.JOB_NAME}"
    }

    stages {
        
        stage('Clone') {
            steps {
                git url: 'https://github.com/softservedata/devopsjen.git', branch: 'practic2'
            }
        }
        
        stage('Build') {
            steps {
                echo "START Build Jobname=$JOB_NAME"
                sh 'mvn -B package -DskipTests'
            }
        }

        stage('Integration Test') {
            parallel {
                stage('Running Application') {
                    agent any
                    options {
                        timeout(time: 60, unit: "SECONDS")
                    }
                    steps {
                        echo "START Application Direcrory name = ${env.JOB_NAME} APP_DIR = $APP_DIR"
                        script {
                            try {
                                dir("${env.WORKSPACE}/../$APP_DIR"){
                                    sh "pwd"
                                    sh 'java -jar target/contact.war'
                                }
                            } catch (Throwable e) {
                                echo "Caught ${e.toString()}"
                                currentBuild.result = "SUCCESS" 
                            }
                        }
                    }
                }
                stage('Running Test') {
                    steps {
                        sleep 30 // seconds
                        echo "START Test"
                        sh 'mvn test -Dtest=RestIT'
                        echo "Done Test"
                    }
                }
            }
        }        
        
    }
}
