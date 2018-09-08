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
        sh 'curl -u admin:admin -X PUT \'http://localhost:9091/repository/maven-snapshot/RoutWebApp1.war\' -T NigamTestApp1/target/RoutWebApp1.war'
      }
    }
    stage('Artifact Promotion') {
      steps {
        sh 'echo "Artifact to be promoted"'
        sh 'echo Some test cases'
        sh 'echo "Some more test cases"'
//        script {
//          server.promote promotionConfig
 //       }
      }
    }
  }
  tools {
    maven 'Maven_3.5.4'
  }
}
