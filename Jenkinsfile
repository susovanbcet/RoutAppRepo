import hudson.slaves.EnvironmentVariablesNodeProperty
import hudson.EnvVars

EnvironmentVariablesNodeProperty prop = jenkins.getGlobalNodeProperties().get(EnvironmentVariablesNodeProperty.class)
EnvVars env = prop.getEnvVars()

def server = Artifactory.newServer url: 'http://localhost:8081/', username: 'admin', password: 'admin'

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
