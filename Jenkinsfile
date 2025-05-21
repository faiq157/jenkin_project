pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-jenkins-app"
        CONTAINER_NAME = "node-jenkins-container"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Stop Old Container') {
            steps {
                sh "docker stop $CONTAINER_NAME || true"
                sh "docker rm $CONTAINER_NAME || true"
            }
        }

        stage('Run New Container') {
            steps {
                sh "docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME"
            }
        }
    }
}
