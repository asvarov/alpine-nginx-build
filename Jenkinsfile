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
                    out = sh script: 'docker ps -f name=blue -q', returnStdout: true
                    if (out) {
                        DEPLOY_ENV_NEW = "green"
                        DEPLOY_ENV_OLD = "blue"
                    } else {
                        DEPLOY_ENV_NEW = "blue"
                        DEPLOY_ENV_OLD = "green"
                    }
                    EXTERNAL_IP = sh script: 'curl --silent ifconfig.so', returnStdout: true
                }
                echo 'Deploying...'
                sh 'chmod +x deploy.sh && ./deploy.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh "chmod +x test_rollback.sh && ./test_rollback.sh ${EXTERNAL_IP} "
            }
        }
    }
}
