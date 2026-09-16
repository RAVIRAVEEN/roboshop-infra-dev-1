data "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/bastion_sg_id"
}

data "aws_ssm_parameter" "backend_alb_sg_id" {
    name = "/${var.project_name}/${var.environment_name}/backend_alb_sg_id"
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