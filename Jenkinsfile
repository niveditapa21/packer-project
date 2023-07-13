pipeline{
    agent any
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
                    echo "validating aws.pkr.hcl"
                    sh "/usr/bin/packer validate aws.pkr.hcl"
                }
        }

         stage ('packer build ami') {
                    steps {
                       withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'b7112dc4-86f9-40e9-87dd-acbac7929e84',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                                 ]]) {
                    echo "building ami"
                    sh "/usr/bin/packer build aws.pkr.hcl"
                }
                    
            }
        }    
    }


}
   

