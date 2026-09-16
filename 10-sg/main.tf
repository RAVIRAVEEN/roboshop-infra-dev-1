module "sg" {
  count = length(var.sg_name)
  source = "git::https://github.com/RAVIRAVEEN/terraform-aws-sg-module.git?ref=main"
  project_name= var.project_name
  environment_name = var.environment_name
  sg_name       =  var.sg_name[count.index]
  description = "created for ${var.sg_name[count.index]}"
  vpc_id      = local.vpc_id

}



# #web accepting traffic from frontend-load_balancer
# resource "aws_security_group_rule""frontend_frontend-lb" {
#   security_group_id = module.sg[9].sg_id              #web-lb
#   source_security_group_id = module.sg[11].sg_id      #frontend_alb_sg id
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
# }