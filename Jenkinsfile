pipeline {
   
    agent node1
    
  stages {

    stage('Checkout Source') {
       agent{ 
                label 'node1'
            }


      steps {

         git branch: "main",
        
          url: 'https://github.com/niveditapa21/packer-project'
      }
    }

stage('Install Packer') {
    agent{ 
                label 'node1'
            }
  

      steps {
        script {

          sh'''#!/bin/bash 
                        
                        sh 'curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -'
                        sh 'sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"'
                        sh 'sudo apt-get update && sudo apt-get install packer'

                    '''
        }
      }
    }

stage('packer validate') {
    agent{ 
                label 'node1'
            }
     

      steps {
        script {

          sh'''#!/bin/bash 
                        packer validate aws.pkr.hcl
                        
                    '''
        }
      }
    }

stage('packer build') {
          agent{ 
                label 'node1'
            }

      steps {
        script {

          sh'''#!/bin/bash 
                        packer build aws.pkr.hcl
                       
                    '''
        }
      }
    }

  }

}
