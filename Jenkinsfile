pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/testing120025-jpg/my-devops-project.git'  // Fixed URL with https://
            }
        }

        stage('Build & Test') {
            steps {
                sh './build.sh'
            }
        }

        stage('Merge PR') {
            when {
                expression { env.CHANGE_ID != null }
            }
            steps {
                script {
                    sh "gh pr merge ${env.CHANGE_ID} --merge"  // Quoting to ensure proper variable expansion
                }
            }
        }
    }

    post {
        success {
            emailext subject: "CI Passed",
                     to: "Testing120025@gmail.com",
                     body: "All tests passed. PR merged."
        }
        failure {
            emailext subject: "CI FAILED",
                     to: "Testing120025@gmail.com",
                     body: "Tests failed. Please check Jenkins."
        }
    }
}

