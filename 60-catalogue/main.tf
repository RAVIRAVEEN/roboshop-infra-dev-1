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
   aws_instance.catalogue.id
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




resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [ aws_instance.catalogue ]
}


resource "aws_ami_from_instance" "catalogue" {
  name               = "${local.common_names_suffix}-catalogue-take-AMI"
  source_instance_id = aws_instance.catalogue.ami
}



resource "aws_launch_template" "catalogue" {
  image_id      = data.aws_ami.catalogue.id
  instance_type = "t3.nano"
}



resource "aws_placement_group" "test" {
  name     = "test"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "catalogue" {
  name                      = "${local.common_names_suffix}-catalogue"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.test.id
  launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]


  }

 
  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }


    launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }


