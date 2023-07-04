pipeline {
   
    agent any

  stages {

    stage('Checkout Source') {
      steps {

         git branch: "main",
        
          url: 'https://github.com/niveditapa21/packer-project'
      }
    }

 stage('Create Packer AMI') {
 steps {
 withCredentials([
 usernamePassword(credentialsId: 'AKIATVJI7JQXLG4BCBGK', passwordVariable: 'baR9D0uydnbHKnge09z6ogRGLSIeqIOrefcNbec3')
 ]) {
 sh 'packer build -var aws_access_key=AKIATVJI7JQXLG4BCBGK -var aws_secret_key=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 packer/packer.json'
 }
 }
 }
 }
 post { 
 always { 
 cleanWs()
 }
 }
 environment {
 npm_config_cache = 'npm-cache-2'
 }
}
