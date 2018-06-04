def server = Artifactory.newServer url: 'http://localhost:8081/', username: 'admin', password: 'admin'
def promotionConfig = [
            // Mandatory parameters
            'buildName'          : buildInfo.name,
            'buildNumber'        : buildInfo.number,
            'targetRepo'         : ' 	libs-release-local',
         
            // Optional parameters
            'comment'            : 'this is the promotion comment',
            'sourceRepo'         : 'libs-release-local',
            'status'             : 'Released',
            'includeDependencies': true,
            'copy'               : true,
            // 'failFast' is true by default.
            // Set it to false, if you don't want the promotion to abort upon receiving the first error.
            'failFast'           : true
        ]

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
        script {
          server.promote promotionConfig
        }
      }
    }
  }
  tools {
    maven 'maven_3.5.3'
  }
}