locals {
common_names_suffix = "${var.project_name}-${var.environment_name}"
catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
ami_id = data.aws_ami.roboshop.id
vpc_id = data.aws_ssm_parameter.vpc_id.value
backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener.arn.value

common_tags = {
    project_name = var.project_name
    environment_name = var.environment_name
    terraform = true
    common_names_suffix = "${var.project_name}-${var.environment_name}"
   
}

}