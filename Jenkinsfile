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
                sh 'sh start.sh || true'
            }
          }
      }

      stage('Build Project'){
          steps{
              sh "/bin/bash rebuild.sh || true"
          }
      }

      stage('Start Dependencies'){
            steps{
                sh "docker start prometheus || true"
                sh "docker start grafana || true"
            }
      }

      stage('Wait 15 seconds'){
            steps{
                sleep 15
            }
      }

      stage('Run Load Tests'){
          steps{
              dir('bkup/'){
                sh "sh addalumnos.sh || true"
                sh "sh getalumnos.sh || true"
              }
          }
      }

      stage('Shutdown Services'){
              steps{
                   sleep 30
                   sh "docker stop microprofileacademy || true"
                   sh "docker stop dbacademy || true"
              }
      }
  }
}