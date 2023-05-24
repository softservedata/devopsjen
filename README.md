>Task

- Clone the repository
- Add **Jenkinsfile** to the root of the new repository
- Add build steps and run an integration test
- Set the environment variable APP_PORT=9090 to run the application on port 9090
- Save the name of the task in a global ["variable"](https://naiveskill.com/jenkins-pipeline-define-variable/)
- Create a build of the project
- Run the application and the integration test in ["parallel stages"](https://e.printstacktrace.blog/how-to-time-out-jenkins-pipeline-stage-and-keep-the-pipeline-running/)
- To launch the application, return to the build folder; use a saved variable for this
- Run only the **RestIT** integration test in the **test** phase of maven
- In this task, stop the parallel stages by timeout
- To successfully complete the process, use the try {} catch {} construction

>Use next template for "Jenkinsfile"


pipeline {
    agent any
    environment {
        // Set the environment variable APP_PORT=9090
        // Save the task name in a global ["variable"](https://naiveskill.com/jenkins-pipeline-define-variable/)
    }
    stages {
        stage('Build') {
            steps {
                // Use the ["maven package"](https://www.baeldung.com/maven-skipping-tests) phase to build the project
            }
        }
        stage('Integration Test') {
            parallel {
                stage('Running Application') {
                    agent any
                    // Set 60 seconds to ["complete the task"](https://e.printstacktrace.blog/how-to-time-out-jenkins-pipeline-stage-and-keep-the-pipeline-running/)
                    steps {
                        script {
                            try {
                                // Use the dir("TODO") { Commands } ["construct"](https://www.baeldung.com/ops/jenkins-pipeline-change-to-another-folder) to return to the target folder
                                // ["Run"](https://www.baeldung.com/java-run-jar-with-arguments) the **contact.war** application from the **target** folder
                            } catch (Throwable e) {
                                // Return ["success"](https://www.jenkins.io/doc/pipeline/steps/workflow-basic-steps/) if the task is stopped after 60 seconds
                            }
                        }
                    }
                }
                stage('Running Test') {
                    steps {
                        // Wait 30 seconds for **contact.war** application to run
                        // Run only the **RestIT** integration test in the **test** phase of ["maven"](https://maven.apache.org/surefire/maven-surefire-plugin/examples/single-test.html)
                    }
                }
            }
        }        
    }
}


>P.S. You can use a Jenkins instance based on ["Killercoda"](https://killercoda.com/softservedata/scenario/PracticalTask1)
