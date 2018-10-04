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
    
    stage ('CI:CodeScan') {
      steps {
        bat '''
          echo " This is CI:CodeScan-Step2" 
        '''
      }
    } 
    
    stage('CI:CodeBuild') {
      steps {
        bat '''
           cd NigamTestApp1/
           mvn -Dmaven.test.failure.ignore=true install
        '''
      }
    }
    stage('CI:ArtifactPush') {
      steps {
        bat 'echo Upload to Artifactory'
        // nexusArtifactUploader credentialsId: 'nexus_admin', groupId: 'gov.ohio.jfs', nexusUrl: 'localhost:9091', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshot', version: 'v1'
        nexusArtifactUploader artifacts: [[artifactId: 'RoutWebApp1.war', classifier: '', file: 'C:/Users/39601483/.jenkins/workspace/Job_Declarative_Test_01/NigamTestApp1/target/RoutWebApp1.war', type: 'bin']], credentialsId: 'nexus_admin', groupId: 'gov.ohio.jfs', nexusUrl: 'localhost:9091', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: 'v1.0.0.1-SNAPSHOT'
        //sh 'curl -u admin:admin -X PUT \'http://localhost:9091/repository/maven-snapshot/RoutWebApp1.war\' -T NigamTestApp1/target/RoutWebApp1.war'
      }
    }
    stage('CI:ArtifactPromo') {
      steps {
        bat 'echo "Artifact to be promoted"'
//        script {
//          server.promote promotionConfig
//        }
       }
    }

//    stage('CI:Notify-CI') {steps {bat 'echo "This is CI:Notify-CI-Step5"'}}
//    stage('CD:PreDeploy') {steps {bat 'echo "This is CD:PreDeploy-Step5"'}}
//    stage('CD:Deploy') {steps {bat 'echo "This is CD:Deploy Step5"'}}   
//    stage('CD:Notify-CD') {steps {bat 'echo "This is CD:Notify-CD -Step5"'}}    
  }
  
  tools {
    maven 'Maven_3.5.4'
  }
}
