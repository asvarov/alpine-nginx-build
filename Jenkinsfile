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
                sh 'chmod +x deploy.sh && ./deploy.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'chmod +x test_rollback.sh && ./test_rollback.sh "34.254.189.66"'
            }
        }
    }
}
