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
                echo "Deploying ${DEPLOY_ENV_NEW} ..."
                sh "chmod +x deploy.sh && ./deploy.sh ${DEPLOY_ENV_NEW} ${DEPLOY_ENV_OLD}"
            }
        }
        stage('Test') {
            steps {
                echo "Testing ${DEPLOY_ENV_NEW} ..."
                sh "chmod +x test_rollback.sh && ./test_rollback.sh ${DEPLOY_ENV_NEW} ${DEPLOY_ENV_OLD} ${EXTERNAL_IP}"
            }
        }
    }
}
