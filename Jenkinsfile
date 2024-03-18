pipeline {
    agent any

    tools {
        terraform 'Terraform'
    }

    environment {
        secret = credentials('terraform-secret')
    }

    stages {
        stage('create a new file secret/secret.json') {
            steps {
                dir('terraform') {
                    sh 'mkdir -p secrets'
                    sh 'cat $secret > secrets/secrets.json'
                    sh 'chmod 777 secrets/secrets.json'
                    sh 'cat secrets/secrets.json'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'cat secrets/secrets.json'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            echo "========always========"
        }
        success {
            echo "========pipeline executed successfully ========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}
