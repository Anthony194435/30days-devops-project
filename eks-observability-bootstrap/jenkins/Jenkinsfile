pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        GITHUB_PAT = credentials('GitHub-Pat')  // Stored as Secret Text in Jenkins
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git url: 'https://github.com/Anthony194435/30days-devops-project.git',
                    credentialsId: 'GitHub-Pat',
                    branch: 'develop'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('eks-observability-bootstrap') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('eks-observability-bootstrap') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('eks-observability-bootstrap') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'develop'
            }
            steps {
                input message: 'Proceed with Terraform Apply?'
                dir('eks-observability-bootstrap') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform apply completed successfully."
        }
        failure {
            echo "❌ Pipeline failed."
        }
    }
}
