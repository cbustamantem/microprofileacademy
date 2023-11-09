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
            sh 'cd db/container/'
            sh 'dir'
            sh 'pwd'
            sh('start.sh')
          }
      }

      stage('Build Project'){
          steps{
              sh "/bin/bash rebuild.sh"
          }
      }
  }
}