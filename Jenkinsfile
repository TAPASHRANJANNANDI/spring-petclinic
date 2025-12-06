pipeline {
    agent any
    
    environment{
        APP_NAME = "spring_petclinic"
    }
    parameters{
        string(name:'BRANCH', defaultValue:'main', description:'branches to build')
    }
    options{
        timeout(time:10, unit:'MINUTES')
    }
    triggers{
        githubPush()
    }
    tools{
        jdk "java-home-25"
        maven "maven-home"
    }
    stages {
        stage('Git-Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Sumukha47/spring-petclinic.git'
            }
        }
        stage('Build-package') {
            steps {
                sh 'mvn package'
            }
        }
    }
    post{
        success{
            mail bcc: '', body: 'This is to inform you that the build is successful ', cc: 'nanditapashranjan35@gmail.com', from: '', replyTo: '', subject: 'Build successful', to: 'sumukhu6@gmail.com'
        }
          failure{
            mail bcc: '', body: 'This is to inform you that the build is failed ', cc: 'nanditapashranjan35@gmail.com', from: '', replyTo: '', subject: 'Build failure', to: 'sumukhu6@gmail.com'
        }
    }
}
