
pipeline{
    agent any

    tools{
        terraform 'Terraform'
    }

    environment{
        secret = credentials('terraform-secret')
    }

// run terraform code 
    stages{

    //    cd terraform

    stage('cd terraform'){
        steps{
            sh 'cd terraform'
        }
    }
    

    stage('create a new file secret/secret.json'){
        steps{
                sh 'mkdir secrets'
                sh 'ls -lh'
                sh 'echo $secret > secrets/secrets.json'
        }
    }


        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
