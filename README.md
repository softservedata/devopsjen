>Task

- Clone the repository
- Add **Jenkinsfile** to the root of the new repository
- Add build steps and run an integration test
- Set the [environment variable](https://www.jenkins.io/doc/pipeline/tour/environment/) APP_PORT=9090 to run the application on port 9090
- Create a [build](https://www.baeldung.com/maven-skipping-tests) of the project
- Write a [multiple commands](https://www.howtogeek.com/269509/how-to-run-two-or-more-terminal-commands-at-once-in-linux/) in one line, separated by '|', '&' and ';' namely:
- [Run](https://www.baeldung.com/java-run-jar-with-arguments) the **contact** application
- Save [process ID](https://linuxhandbook.com/find-process-id/) [to variable or file](https://serverfault.com/questions/205498/how-to-get-pid-of-just-started-process);
- [Run](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html) the integration test in the **integration-test** phase of maven
- After the test is finished, [stop](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-how-to-kill-a-process-from-the-command-line) the main application.

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
        stage('Integration Test') {
            steps {
                // Write a multiple commands in one line
            }
        }        
    }
}
```

>P.S. You can use a Jenkins instance based on ["Killercoda"](https://killercoda.com/softservedata/scenario/PracticalTask1)
