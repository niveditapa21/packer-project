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

  provisioner "file" {
    source      = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["ls -la /tmp"]
  }

  provisioner "shell" {
    inline = ["pwd"]
  }
 

  provisioner "shell" {
    script = "/tmp/provisioner.sh"
  }
}
