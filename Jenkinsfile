
pipeline{
    agent any

    tools{
        terraform 'Terraform'
    }

// run terraform code 
    stages{

    //    cd terraform

    stage('cd terraform'){
        steps{
            sh 'cd terraform'
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
