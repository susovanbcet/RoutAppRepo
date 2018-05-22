pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
      }
    }
    stage('Build') {
      steps {
        sh '''
                  cd NigamTestApp1/
                  mvn -Dmaven.test.failure.ignore=true install
                '''
      }
    }
    stage('Upload to Artifactory') {
      steps {
        sh 'curl -u admin:admin -X PUT \'http://localhost:8081/artifactory/libs-release-local/RoutWebApp1.war\' -T NigamTestApp1/target/RoutWebApp1.war'
      }
    }
    stage('test1') {
      steps {
        echo 'Hello'
      }
    }
  }
  tools {
    maven 'maven_3.5.3'
  }
}