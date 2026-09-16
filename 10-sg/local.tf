locals {
common_names_suffix = "${var.project_name}-${var.environment_name}"
vpc_id = data.aws_ssm_parameter.vpc_id.value
}

