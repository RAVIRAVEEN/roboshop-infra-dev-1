#backend accepting connection from bastion_sq 
resource "aws_security_group_rule""backend_alb_bastion" {
  security_group_id = local.backend_alb_sg_id           #backend
  source_security_group_id = local.bastion_sg_id    ##bastion 
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}

#bastion accepting connection from internet
resource "aws_security_group_rule""bastion_laptop" {
  security_group_id = local.bastion_sg_id         
  cidr_blocks =  ["0.0.0.0/0"]    
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}



resource "aws_security_group_rule""mongodb_bastion" {
  security_group_id = local.mongodb_sg_id           #mongodb
  source_security_group_id = local.bastion_sg_id    ##bastion 
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}



resource "aws_security_group_rule""redis_bastion" {
  security_group_id = local.redis_sg_id           #redis
  source_security_group_id = local.bastion_sg_id    ##bastion 
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}
