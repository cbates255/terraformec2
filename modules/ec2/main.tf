#data "template_file" "boot_script" {
#  template = "${file("${path.cwd}/boot_script.sh")}"
#}


resource "aws_instance" "app_server" {
  ami           = var.image_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  security_groups = [ var.sg_id ]
  #user_data = data.template_file.boot_script.rendered
  tags = {
    Name = var.tags
  }
}