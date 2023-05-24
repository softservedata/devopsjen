>Task

- Clone the repository
- Add a **Jenkinsfile** to the root of new repository
- Add [build](https://www.baeldung.com/maven-skipping-tests) steps and [unit tests](https://howtodoinjava.com/maven/maven-run-junit-tests/) to the Jenkinsfile
- Set the APP_PORT=9090 [environment variable](https://www.jenkins.io/doc/pipeline/tour/environment/) to run the application on port 9090
- Create and running a Jenkins pipeline job using the Jenkinsfile

>Use next template for "Jenkinsfile"

```
pipeline {
    // Use any agent
    // Set the environment variable APP_PORT=9090
    stages {
        stage('Build') {
            steps {
                // Use the maven package phase to build the project
            }
        }
        stage('Unit Test') {
            steps {
                 // Use the maven test phase to run unit tests
            }
        }
    }
}
```

>P.S. You can use a Jenkins instance based on ["Killercoda"](https://killercoda.com/softservedata/scenario/PracticalTask1)
