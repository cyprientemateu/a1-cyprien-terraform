terraform {
  source = "../../../../modules//bastion-host/"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../vpc-02", 
    ]
}

inputs = {
  aws_region                    = "us-east-1"
  ec2_instance_ami              = "ami-0fc5d935ebf8bc3bc"
  ec2_instance_type             = "t2.micro"
  sg_name                       = "bastion-sg"
  instance_name                 = "bastion"
  vpc_id                        = "vpc-068852590ea4b093b"
  subnet_id                     = "subnet-096d45c28d9fb4c14"
  root_volume_size              = 10
  instance_count                = 1
  enable_termination_protection = false
  ec2_instance_key_name         = "terraform-aws"
  allowed_ports = [
    22
  ]
  tags = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}