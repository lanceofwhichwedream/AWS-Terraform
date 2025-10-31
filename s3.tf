resource "aws_s3_bucket" "lb_logs" {
  bucket = "lb_logs_${var.env}"

  tags = {
    Environment = var.env
  }
}