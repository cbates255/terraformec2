module "ec2" {
  source = "./modules/ec2"
  image_ami = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = "ExampleAppServerInstance"
}