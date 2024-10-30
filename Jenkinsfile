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
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construir la imagen Docker y etiquetarla como 'latest'
                script {
                    docker.build("backend")
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Ejecutar docker-compose para el despliegue
                sh '''
                docker-compose down
                docker-compose up -d --build
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
