packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# which ami to use as the base and where to save it
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-06b09bfacae1453cb"
  ssh_username    = "ec2-user"
  ami_users       = ["251878394926"]
  ami_regions     = [
                      "us-east-1"
                    ]
}
variables {
  aws_access_key = "AKIATVJI7JQXG2UPI3UI"
  aws_secret_key = "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"
}

# what to install, configure and file to copy/execute
build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }
  
  provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }
  
    provisioner "shell" {
    inline = [ "pwd"]
  }
  
  provisioner "shell" {
    inline = ["/tmp/provisioner.sh"]
  }
}
