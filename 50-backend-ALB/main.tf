resource "aws_lb" "backend_alb" {
  name               = "${local.common_names_suffix}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false  #true

 tags = merge(
    local.common_tags,
  
         {
        Name = "${local.common_names_suffix}-backend-alb"
    }
  
  )
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "hi this is from devops team"
      status_code  = "200"
    }
  }
}