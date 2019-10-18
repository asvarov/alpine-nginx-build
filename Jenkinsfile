pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...$BUILD_NUMBER'
                docker.build registry + ":$BUILD_NUMBER"
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
