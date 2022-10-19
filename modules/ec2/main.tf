resource "aws_instance" "app_server" {
  ami           = var.image_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  security_groups = [ var.sg_id ]
  user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum upgrade -y
  sudo yum install httpd -y
  sudo systemctl enable httpd
  sudo systemctl start httpd
  EOF
  tags = {
    Name = var.tags
  }
}