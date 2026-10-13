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



data "aws_ssm_parameter" "catalogue_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/catalogue_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment_name}/private_subnet_ids"
}

