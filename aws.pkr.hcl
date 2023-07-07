
{
    "builders":[
        {

        "type": "amazon-ebs",
        "access_key":"AKIATVJI7JQXNCG56QGW",
        "secret_key":"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",
        "region": "us-east-1"
        "ami_name": "NIVEDITA_AMI-{{timestamp}}",
        "source_ami": "ami-06b09bfacae1453cb",
        "instance_type": "t2.micro",
        "ssh_username":"ec2-user",
        "ssh_agent_auth": "false",
         "associate_public_ip_address": "true",
         "ssh_interface": "public_ip",
         "temporary_key_pair_type": "224key"

        }
        





    ],
    
    "provisioners": [
        {
          
            "type": "file",
            "source": "installer.sh",
            "destination": "/tmp/provisioner.sh"
        },
        
        
          {"type": "shell",
            "inline": [
                "chmod a+x /tmp/provisioner.sh",
                "ls -la /tmp",
                "pwd",
                "/tmp/provisioner.sh"]


           }
        
    ]
      


    
}
