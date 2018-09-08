pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        bat '''
           echo "PATH = ${PATH}"
           echo "M2_HOME = ${M2_HOME}"
        '''
      }
    }
    stage('Build') {
      steps {
        bat '''
           cd NigamTestApp1/
           mvn -Dmaven.test.failure.ignore=true install
        '''
      }
    }
    stage('Upload to Artifactory') {
      steps {
        bat 'echo Upload to Artifactory'
        //sh 'curl -u admin:admin -X PUT \'http://localhost:9091/repository/maven-snapshot/RoutWebApp1.war\' -T NigamTestApp1/target/RoutWebApp1.war'
      }
    }
    stage('Artifact Promotion') {
      steps {
        bat 'echo "Artifact to be promoted"'
        bat 'echo Some test cases'
        bat 'echo "Some more test cases"'
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
