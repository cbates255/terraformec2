resource "aws_instance" "app_server" {
  ami           = var.image_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  security_groups = var.sg_id
  tags = {
    Name = var.tags
  }
}