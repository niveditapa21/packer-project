packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
} 
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "LINUX_NIVEDITA_AMI-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-06b09bfacae1453cb"
  #access_key  = ""
  #secret_key  = ""
  ssh_username    = "ec2-user"
  ssh_agent_auth  =  "false"
  associate_public_ip_address = "true"
  ssh_interface = "public_ip"
  #ami_users       = [""]
  ami_regions     = [
                      "us-east-1"
                    ]
}



build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner  {
    type        = "file"
    source      = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner  {
    type   = "shell"
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }

  provisioner  {
    type   = "shell"
    inline = ["ls -la /tmp"]
  }

  provisioner  {
    type   = "shell"
    inline = ["pwd"]
  }
 

  provisioner {
    type   = "shell" 
    script = "/tmp/provisioner.sh"
  }
}
