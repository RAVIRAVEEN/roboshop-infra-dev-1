variable "project_name" {
    default = "roboshop"
  
}

variable "environment_name" {
  default = "dev"
}

variable "sg_name" {
               #database
  default = ["mongodb", "redis", "mysql", "rabbitmq",                            #list of variables
              #backend
              "catalogue", "shipping", "user", "cart", "payment",
              #frontend
              "frontend",
              #bastion
              "bastion",
              #frontend-load-balancer
              "frontend_alb",
              #backend_alb
              "backend_alb"

               
   ]
}

