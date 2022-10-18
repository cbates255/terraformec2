resource "aws_security_group" "web_traffic" {
  name        = var.sg_name
  description = "Allow inbound traffic"

  ingress {
    from_port        = var.sg_ingress_port
    to_port          = var.sg_ingress_port
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }

  tags = {
    Name = var.sg_tags
  }
}