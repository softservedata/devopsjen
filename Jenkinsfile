pipeline {
    agent any

    environment {
        APP_PORT=9090
    }

    stages {
        
        stage('Build') {
            steps {
                echo "START Build"
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
                        echo "START Application"
                        script {
                            try {
                                sh 'java -jar ../check/target/practic.war'
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
