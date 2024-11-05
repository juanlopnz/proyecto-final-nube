pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Jesus-0sorio/layered-architecture-node.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Unit Tests with Coverage') {
            steps {
                // Ejecutar tests y generar el reporte de cobertura
                sh script: 'npm run coverage', returnStatus: true
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
        always {
            // Publica el reporte de cobertura usando Cobertura
            recordCoverage(
                tools: [[parser: 'COBERTURA', pattern: 'coverage/cobertura-coverage.xml']],
                sourceCodeRetention: 'EVERY_BUILD',
                qualityGates: [
                    [threshold: 80.0, metric: 'LINE', baseline: 'PROJECT'],
                    [threshold: 65.0, metric: 'BRANCH', baseline: 'PROJECT']
                ]
            )
        }
        success {
            echo 'Build and tests passed!'
        }
        failure {
            echo 'Build failed'
        }
    }
}