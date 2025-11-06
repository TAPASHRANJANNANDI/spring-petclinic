pipeline {

    agent any

    environment {
        APP_NAME = "spring-petclinic"
    }

    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Branch to build from')
    }

    options {
        timeout(time: 10, unit: 'MINUTES')
    }

    tools {
        jdk "java-home-25"
        maven "maven-home"
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/Sumukha47/spring-petclinic.git'
            }
        }

        stage('Build and Package') {
            steps {
                bat 'mvn package'
            }
        }

        stage('Artifact Extraction') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {

        success {
            echo "Build succeeded for ${APP_NAME}"

            mail(
                to: 'sumukhadaring@gmail.com',
                cc: 'akshathabm20@gmail.com',
                subject: "SUCCESS: ${APP_NAME} Build #${env.BUILD_NUMBER}",
                body: """Hello Developer,

Jenkins Pipeline for **${env.JOB_NAME}** completed successfully.

Build Details:
- Build Number: ${env.BUILD_NUMBER}
- Build URL: ${env.BUILD_URL}
- Console Logs: ${env.BUILD_URL}console
- Artifacts Download: ${env.BUILD_URL}artifact/target/

Best regards,
Sumukha Upadhyaya
"""
            )
        }

        failure {
            mail(
                to: 'sumukhadaring@gmail.com',
                cc: 'akshathabm20@gmail.com',
                subject: "FAILURE: ${APP_NAME} Build #${env.BUILD_NUMBER}",
                body: """Hello Developer,

Jenkins Pipeline for **${env.JOB_NAME}** has failed.

Build URL: ${env.BUILD_URL}
Console Logs: ${env.BUILD_URL}console
(If generated) Artifacts: ${env.BUILD_URL}artifact/target/

Please check the logs to resolve the issue.

Best regards,
Sumukha Upadhyaya
"""
            )
        }
    }
}
