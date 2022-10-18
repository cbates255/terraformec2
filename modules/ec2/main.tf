data "template_file" "boot_script" {
  template = "${file("${path.cwd}/boot_script.sh")}"
}


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
  sudo systemctl enable nginx
  sudo systemctl start nginx
  EOF
  tags = {
    Name = var.tags
  }
}