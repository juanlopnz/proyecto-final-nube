pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio
                git branch: 'main', url: 'https://github.com/Jesus-0sorio/layered-architecture-node.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Instalar dependencias
                sh 'npm install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                // Ejecutar tests unitarios
                sh script: 'npm test', returnStatus: true
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t backend .'
            }
        }
        
        stage('Deploy') {
            steps {
                sh '''
                docker rm -f minio || true
                docker rm -f backend || true
                docker compose down --remove-orphans
                docker compose up -d --build
                '''
            }
        }
    }

    post {
        success {
            // Notificación de éxito
            echo 'Build and tests passed!'
        }
        failure {
            // Notificación de fallos
            echo 'Build failed'
        }
    }
}
