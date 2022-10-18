module "ec2" {
  source = "./modules/ec2"
  image_ami = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  tags = "ExampleAppServerInstance"
  sg_id = module.security_group.group_id
}

module "security_group" {
  source = "./modules/security"
  sg_name = "web_traffic"
  sg_ingress_port = 80
  sg_tags = "example_security_group"
}