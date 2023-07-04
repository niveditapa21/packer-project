pipeline {


  stages {

    stage('Source') {
      steps {

        git branch: "main",
        // create keygen in the ami to git clone
          url: 'git@github.com:nivedita21/packer-project.git'
      }
    }

    stage('Install Packer') {
      steps {
        script {

          sh'''#!/bin/bash 
                        curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
                        sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                        sudo apt-get update && sudo apt-get install packer
                    '''
        }
      }
    }

    stage('packer validate') {
      steps {
        script {

          sh'''#!/bin/bash 
                        packer validate aws.pkr.hcl
                        packer validate buildspec.yaml
                        packer validate provisioner.sh
                    '''
        }
      }
    }

    stage('packer build') {
      steps {
        script {

          sh'''#!/bin/bash 
                        packer build aws.pkr.hcl
                        packer build buildspec.yaml
                        packer build provisioner.sh
                    '''
        }
      }
    }

  }

}
