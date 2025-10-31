resource "aws_lb" "cool_loadbalancer" {
  name               = "cool-loadbalancer-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_network.id]
  subnets            = [ aws_vpc.cool_network.id ]

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "cool-lb-${var.env}"
    enabled = true
  }

  tags = {
    Environment = var.env
  }

}

resource "aws_lb_listener" "cool_alb_listener" {
  load_balancer_arn = aws_lb.cool_loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
