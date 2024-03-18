pipeline {
    agent any

    tools {
        terraform 'Terraform'
    }

    environment {
        secret = credentials('terraform-key')
    }

    stages {
        stage('create a new file secret/secret.json') {
            steps {
                dir('terraform') {
                    // sh 'mkdir -p secrets'
                    // sh 'base64 $secret | base64 --decode > secrets/secrets.json'
                    sh 'base64 $secret | base64 --decode > secrets.json'
                    sh 'chmod 777 secrets.json'
                    sh 'cat secrets.json'
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
                    sh 'cat secrets/secrets.json'
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
            // clean up
            dir('terraform') {
                sh 'rm -rf .terraform'
                sh 'rm -rf secrets'
            }

            // clean up
            dir('terraform') {
                sh 'rm -rf .terraform'
                sh 'rm -rf secrets.json'
            }


        }
        success {
            echo "========pipeline executed successfully ========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}
