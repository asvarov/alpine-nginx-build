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
                script {
                    out = sh script: 'docker ps -f name=blue -q'
                    if (out) {
                        echo 'I only execute on the master branch'
                        DEPLOY_ENV_NEW = "green"
                        DEPLOY_ENV_OLD = "blue"
                    } else {
                        echo 'I execute elsewhere'
                        DEPLOY_ENV_NEW = "blue"
                        DEPLOY_ENV_OLD = "green"
                    }
                }
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
