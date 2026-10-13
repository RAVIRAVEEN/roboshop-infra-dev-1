resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id = local.private_subnet_ids

  tags = merge(
    local.common_tags,
  
    {
        Name = "${local.common_names_suffix}-catalogue"
    }
  
  )

}

resource "terraform_data" "catalogue" {
  triggers_replace = [
   aws_instance.mongodb.id
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }

  #terraform copy the file into the mongodb server
 provisioner "file" {
  source      = "catalogue.sh"
  destination = "/tmp/catalogue.sh"
 }

provisioner "remote-exec" {
    inline = [
      " chmod +x /tmp/catalogue.sh",
      "sudo sh /tmp/catalogue.sh catalogue ${var.environment_name}"

    ]
  }

}




# resource "aws_ec2_instance_state" "catalogue" {
#   instance_id = aws_instance.catalogue.id
#   state       = "stopped"
#   depends_on = [ aws_instance.catalogue ]
# }


# resource "aws_ami_from_instance" "catalogue" {
#   name               = "${local.common_names_suffix}-catalogue-take-AMI"
#   source_instance_id = aws_instance.catalogue.ami
# }


 


# resource "aws_autoscaling_group" "catalogue" {
#   availability_zones = ["us-east-1a"]
#   desired_capacity   = 1
#   max_size           = 1
#   min_size           = 1


#   launch_template {
#     id      = aws_launch_template.catalogue.id
#     version = aws_launch_template.catalogue.latest_version
#   }


#   instance_refresh {
#     strategy = "Rolling"
#     preferences {
#       min_healthy_percentage = 75
#     }
#     triggers = ["tag"]
#   }
# }



# resource "aws_launch_template" "example" {
#   image_id      = data.aws_ami.example.id
#   instance_type = "t3.nano"
# }


