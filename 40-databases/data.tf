data "aws_ami" "roboshop" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



data "aws_ssm_parameter" "mongodb_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/redis_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/mysql_sg_id"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.environment_name}/database_subnet_ids"
}