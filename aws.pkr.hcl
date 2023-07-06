
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "ami-version-1.0.1-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-06b09bfacae1453cb"
  access_key  = "AKIATVJI7JQXK4YESPAI"
  secret_key  = "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"
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
