module "ec2" {
  source = "./modules/ec2"
  image_ami = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = "ExampleAppServerInstance"
}

module "security_group" {
  source = "./security"
  sg_name = "web_traffic"
  sg_ingress_port = 443
  sg_tags = "example_security_group"
}