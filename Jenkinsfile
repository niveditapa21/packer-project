pipeline{
    agent any
      tools {
        packer 'Packer' 
        }
    stages{
        stage("code pull from repo"){
            steps{
                git branch: "main",
        
                url: 'https://github.com/niveditapa21/packer-project'
            }
        }

         stage ('Packer init') {
                  steps {
                   script {
                    echo "initializing packer"
                    sh "/usr/bin/packer version"
                    sh  "/usr/bin/packer init aws.pkr.hcl"
                      }  
                }
        }

        stage ('Packer validate') {
                   steps {
                    echo 'validating packer code'
                    sh '/usr/bin/packer validate aws.pkr.hcl'
                }
        }

         stage ('packer build ami') {
                    steps {
                        withCredentials([com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding]) {
                    echo 'building ami'
                    sh '/usr/bin/packer build aws.pkr.hcl'
                }
                    
            }
        }    
    }


}
   

