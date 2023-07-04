pipeline {
   
    agent any

  stages {

    stage('Source') {
      steps {

        sh 'git clone https://github.com/niveditapa21/packer-project.git .'
        sh 'npm install'
      }
    }

    stage('Install Packer') {
      steps {
        script {

          sh'''#!/bin/bash 
                        sudo yum install -y yum-utils
                        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
                        sudo yum -y install packer
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
