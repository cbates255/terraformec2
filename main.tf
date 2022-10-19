module "ec2" {
  source        = "./modules/ec2"
  image_ami     = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  tags          = "ExampleAppServerInstance"
  sg_id         = module.security_group.group_id
  profile       = module.IAM.instance_profile
}

module "security_group" {
  source          = "./modules/security"
  sg_name         = "web_traffic"
  sg_ingress_port = 80
  sg_tags         = "example_security_group"
}

module "IAM" {
  source        = "./modules/IAM"
  policy_name   = "ec2_list_buckets"
  role_name     = "ec2_project_role"
  profile_name  = "project_profile"
}