pipeline {
  agent any

  environment {
    PROJECT_NAME="microprofileacademy"
    GIT_URL="https://github.com/cbustamantem/microprofileacademy.git"
    MAJOR_VERSION = 1
  }

  stages {
      stage('Start DB'){
          steps{
            dir('db/'){
                sh 'dir'
                sh 'pwd'
                sh 'ls -l'
                sh 'sh start.sh'
            }
          }
      }

      stage('Build Project'){
          steps{
              sh "/bin/bash rebuild.sh"
          }
      }
  }
}