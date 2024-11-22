pipeline {
    agent any

    environment {
        registry = 'ivanvolvenko'
        imageName = 'vue-paper-dashboard'
        dockerImage = "${registry}/${imageName}"
        dockerhubToken = 'dckr_pat_NsgGVfx8v9BKtX56fnp0xUNb6H8'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh "docker build -t ${dockerImage} ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    sh "docker login -u ${registry} -p ${dockerhubToken}"
                    sh "docker push ${dockerImage}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker-compose down"
                    sh "docker-compose up -d --build"
                }
            }
        }
    }
}

