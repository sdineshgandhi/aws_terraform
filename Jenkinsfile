pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID') // Replace with your credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') // Replace with your credentials ID
    }

    stages {
        stage('checkout') {
            steps {
                script{
                    dir("terraform")
                    {
                        git 'https://github.com/sdineshgandhi/aws_terraform.git'
                    }
                      }
                  }
           }           

        stage('terraform plan') {
            steps {
                sh 'cd terraform; terraform init'
                sh 'cd terraform; terraform plan -out tfplan'
                sh 'cd terraform; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Terraform Apply') {
            steps {
                
                sh 'cd terraform; terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
