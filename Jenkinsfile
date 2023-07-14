pipeline{
    agent any
    stages{
        stage("code pull from repo"){
            steps{
                git branch: "main",
        
                url: 'https://github.com/niveditapa21/packer-project'
            }
        }

        stage ('Packer install') {
                  steps {
                       withCredentials([usernamePassword(credentialsId: '6568502e-79f4-4cf5-aab2-481ca71fe4b9', passwordVariable: 'myb@21aug1990', usernameVariable: 'nive')]) 
                      {
                    echo "installing packer"
                    bash "/home/nive/packer-project/buildspec.sh"
                     }  
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
                       withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: '33adbf67-6744-4860-8423-e60e35cf2b12',
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
   

