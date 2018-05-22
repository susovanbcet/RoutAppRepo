pipeline {
    agent any
    tools {
        maven 'maven_3.5.3'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh '''
                  cd NigamTestApp1/
                  mvn -Dmaven.test.failure.ignore=true install
                '''
            }           
        }
    }
}