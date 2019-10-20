pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...$BUILD_NUMBER'
                sh "whoami && ls -lah"
                sh "docker build . -t asvarov/${JOB_NAME}:${BUILD_NUMBER}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
