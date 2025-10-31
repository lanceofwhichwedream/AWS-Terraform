resource "aws_launch_template" "cool_application" {
  name_prefix   = "application-${var.env}"
  image_id      = var.image_id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"

    tags = {
      Environment = var.env
    }
  }
}

resource "aws_autoscaling_group" "cool_autoscaler" {
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity

  launch_template {
    id      = aws_launch_template.cool_application.id
    version = "$Latest"
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "tf-lb-tg-cool-application-${var.env}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cool_network.id
}

# aws_autoscaling_traffic_source_attachment will take upwards of 30 minutes to provision in aws
# that being said, it does provision therefore we will use the import command to pull it into the
# state file instead

#import {
#  to = aws_autoscaling_traffic_source_attachment.autoscale_traffic_source
#  identity = {
#    "arn" = "arn:aws:elasticloadbalancing:eu-west-1:036449353719:targetgroup/tf-lb-tg-cool-application-dev/72246473c6d1e220"
#  }
#}

#resource "aws_autoscaling_traffic_source_attachment" "autoscale_traffic_source" {
#  autoscaling_group_name = aws_autoscaling_group.cool_autoscaler.id

#  traffic_source {
#    identifier = aws_lb_target_group.target_group.arn
#    type       = "elbv2"
#  }
#}
