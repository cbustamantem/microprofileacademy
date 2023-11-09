pipeline {
  agent any

  environment {
    PROJECT_NAME="microprofileacademy"
    GIT_URL="https://github.com/cbustamantem/microprofileacademy.git"
    MAJOR_VERSION = 1
  }
  stages {
        stage ('Start DB'){
            steps {
                script {
                    echo "Starting Database"
                    cd db/container/
                    sh start.sh
                }
            }
        }

        stage ('Build project'){
            steps {
                script {
                    echo "${GIT_URL}"
                    /bin/bash rebuild.sh
                }
            }

        }
  }
}