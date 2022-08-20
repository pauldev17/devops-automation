pipeline {
    agent any
    tools{
        maven 'maven_3_8_6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pauldev17/devops-automation']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t paulcabreradev/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u paulcabreradev -p ${dockerhubpwd}'
}
                   sh 'docker push paulcabreradev/devops-integration'
                }
            }
        }

    }
}