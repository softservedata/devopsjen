>Task

- Clone the repository
- Add a **Jenkinsfile** to the root of new repository
- Add build steps and unit tests to the Jenkinsfile
- Set the APP_PORT=9090 environment variable to run the application on port 9090
- Create and running a Jenkins pipeline job using the Jenkinsfile

>Use next template for "Jenkinsfile"

```
pipeline {
    agent any
    environment {
      // TODO
    }
    stages {
        stage('Build') {
            steps {
                // TODO
            }
        }
        stage('Unit Test') {
            steps {
                 // TODO
            }
        }
    }
}
```
