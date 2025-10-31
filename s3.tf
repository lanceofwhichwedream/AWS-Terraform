resource "aws_s3_bucket" "lb_logs" {
  bucket = "cool-lb-logs-${var.env}"

  tags = {
    Environment = var.env
  }
}

#import {
#  to = aws_s3_bucket.lb_logs
#  identity = {
#    bucket = "lb-logs-${var.env}"
#  }
#}
