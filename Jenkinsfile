pipeline {
agent any

environment {
    AWS_REGION = "us-east-1"
    ECR_REPO = "628590695807.dkr.ecr.us-east-1.amazonaws.com/trendstore"
    CLUSTER_NAME = "trendstore-cluster"
    RELEASE_NAME = "trend-store"
}

stages {

    stage('Checkout') {
        steps {
            git 'https://github.com/unezb/TrendStore.git'
            }
        }

    stage('Build Docker Image') {
        steps {
            sh '''
            docker build -t trend-store .
            '''
            }
        }

    stage('Login to ECR') {
        steps {
            sh '''
            aws ecr get-login-password --region $AWS_REGION \
            | docker login --username AWS --password-stdin 628590695807.dkr.ecr.us-east-1.amazonaws.com
            '''
            }
        }

    stage('Push Image to ECR') {
        steps {
            sh '''
            docker tag trendstore:latest $ECR_REPO:latest
            docker push $ECR_REPO:latest
            '''
            }
        }

    stage('Update kubeconfig') {
        steps {
            sh '''
            aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
            '''
            }
        }

    stage('Deploy with Helm') {
        steps {
            sh '''
            helm upgrade --install $RELEASE_NAME ./trend-store
            '''
            }
        }
    }
}