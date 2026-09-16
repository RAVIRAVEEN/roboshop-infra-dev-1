locals {
common_names_suffix = "${var.project_name}-${var.environment_name}"
ami_id = data.aws_ami.roboshop.id
mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
database_subnet_ids = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]

common_tags = {
    project_name = var.project_name
    environment_name = var.environment_name
    terraform = true
   
}

}