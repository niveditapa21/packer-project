
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-06b09bfacae1453cb"
  aws_access_key  = "AKIATVJI7JQXEQ4YCQEE"
  aws_secret_key  = "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"
  ssh_username    = "ec2-user"
  ami_users       = ["251878394926"]
  ami_regions     = [
                      "us-east-1"
                    ]
}



build {
  
  sources = [ "source.amazon-ebs.amazon-linux"]

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
