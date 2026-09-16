variable "aws_cidr" {
    default = "10.0.0.0/16"
  
}
  variable "project_name" {
    default = "roboshop"
    
  }

variable "environment_name" {
    default = "dev"
  
}
variable "vpc_tags" {
    default = {
        purpose = "vpc-module-test"
        dontdelete = true
    }
  
}

variable "aws_subnet_public_cidr" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    type = list
  
}

variable "aws_subnet_private_cidr" {
    default = ["10.0.11.0/24", "10.0.12.0/24"]
    type = list
  
}

variable "aws_subnet_database_cidr" {
    default = ["10.0.21.0/24", "10.0.22.0/24"]
    type = list
  
}


