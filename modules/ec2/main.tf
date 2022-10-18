resource "aws_instance" "app_server" {
  ami           = var.image_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  
  tags = {
    Name = var.tags
  }
}