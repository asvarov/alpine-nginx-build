pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...$BUILD_NUMBER'
                sh "docker build ."
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
