pipeline {
   
    agent none
    environment {
       aws_access_key = 'AKIATVJI7JQXLG4BCBGK'
       aws_secret_key = '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'
    }
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
                        
                         sh 'sudo yum install -y yum-utils'
                         sh 'sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                         sh 'sudo yum -y install packer'

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
