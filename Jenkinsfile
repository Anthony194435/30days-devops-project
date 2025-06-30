pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        GITHUB_PAT = credentials('GitHub-Pat')  // Stored as Secret Text in Jenkins
    }

    stages {

        stage('Clean Jenkins Workspace') {
          steps {
            deleteDir() // wipes the workspace completely before the next stage
          }
        }

        stage('Clone GitHub Repo') {
            steps {
                git url: 'https://github.com/Anthony194435/30days-devops-project.git',
                    credentialsId: 'GitHub-Pat',
                    branch: 'develop'
            }
        }


        stage('Clean .terraform Cache') {
            steps {
                dir('eks-observability-bootstrap') {
                    sh 'rm -rf .terraform .terraform.lock.hcl'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('eks-observability-bootstrap') {
                    sh 'terraform version'
                    sh 'terraform init -upgrade -reconfigure'
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
