pipeline {
   
    agent any

  stages {

    stage('Checkout Source') {
      steps {

         git branch: "main",
        
          url: 'https://github.com/niveditapa21/packer-project'
      }
    }

stage('Install Packer') {
      steps {
        script {

          sh'''#!/bin/bash 
                        
                         curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo -S apt-key add -
                         sudo -S yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo 
                         sudo -S  yum -y install packer 
                    '''
        }
      }
    }

stage('packer validate') {
      steps {
        script {

          sh'''#!/bin/bash 
                        packer validate aws.pkr.hcl
                        
                    '''
        }
      }
    }

stage('packer build') {
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
