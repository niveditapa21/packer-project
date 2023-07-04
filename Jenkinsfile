pipeline {

  agent { label 'packer-project' }

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
                        packer validate build_jenkins_agent_ami_packer/jenkins-agent-ubuntu-ami.json
                    '''
        }
      }
    }

    stage('packer build') {
      steps {
        script {

          sh'''#!/bin/bash 
                        packer build build_jenkins_agent_ami_packer/jenkins-agent-ubuntu-ami.json
                    '''
        }
      }
    }

  }

}
