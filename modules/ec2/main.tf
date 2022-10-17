resource "aws_instance" "app_server" {
  ami           = var.image_ami
  instance_type = var.instance_type

  tags = {
    Name = var.tags
  }
}