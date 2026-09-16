

data "aws_ssm_parameter" "backend_alb_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/backend_alb_sg_id"
}

# data "aws_ssm_parameter" "public_subnet_ids" {
#   name = "/${var.project_name}/${var.environment_name}/public_subnet_ids"
# }

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment_name}/private_subnet_ids"
}