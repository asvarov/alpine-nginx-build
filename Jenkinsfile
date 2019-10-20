pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh "docker build . -t asvarov/${JOB_NAME}:${BUILD_NUMBER}"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'deploy.sh
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
    }
}
