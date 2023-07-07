
source "amazon-ebs" "amazon-linux" {
  region          = "us-east-1"
  ami_name        = "NIVEDITA_AMI-{{timestamp}}"
  instance_type   = "t2.micro"
  source_ami      = "ami-06b09bfacae1453cb"
  access_key  = "AKIATVJI7JQXNCG56QGW"
  secret_key  = "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"
  ssh_username    = "ec2-user"
  ssh_agent_auth  =  "false"
  associate_public_ip_address = "true"
  ssh_interface = "public_ip"
  #ami_users       = ["251878394926"]
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
