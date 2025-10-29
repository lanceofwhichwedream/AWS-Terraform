resource "aws_launch_template" "cool_application" {
  name_prefix   = "application"
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "cool_autoscaler" {
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity

  launch_template {
    id      = aws_launch_template.cool_application
    version = "$Latest"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "tf-lb-tg-cool-application" #Add Env var
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cool_network.id
}

resource "aws_autoscaling_traffic_source_attachment" "autoscale_traffic_source" {
  autoscaling_group_name = aws_autoscaling_group.cool_autoscaler.id

  traffic_source {
    identifier = aws_lb_target_group.target_group.arn
    type       = "elbv2"
  }
}