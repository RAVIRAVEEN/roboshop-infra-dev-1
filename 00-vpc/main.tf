module "vpc" {
    source = "git::https://github.com/RAVIRAVEEN/terraform-aws-vpc-module.git?ref=main"
    aws_cidr = var.aws_cidr
    project_name =var.project_name
    environment_name = var.environment_name
    vpc_tags = var.vpc_tags

    #public_subnet _cidr
    aws_subnet_public_cidr = var.aws_subnet_public_cidr
    
    # private_subnet_cidr
  aws_subnet_private_cidr = var.aws_subnet_private_cidr

   # database_subnet_cidr
  aws_subnet_database_cidr = var.aws_subnet_database_cidr

  
}

