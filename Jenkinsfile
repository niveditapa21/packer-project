pipeline {
   agent none
   stages {

    stage('github') {
       agent{
          label 'master'
       }
       steps {

         git branch: "main",
        
          url: 'https://github.com/niveditapa21/packer-project'
          
      }
    }



stage('packer validate') {
   agent{
          label 'master'
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
          label 'master'
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

