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
                echo 'Testing..'
                sh 'docker-compose --project-name "GREEN" up -d'
            }
        }
        stage('Test') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
