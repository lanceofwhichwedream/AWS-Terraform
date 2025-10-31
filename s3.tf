resource "aws_s3_bucket" "lb_logs" {
  bucket = "lb-logs-${var.env}"

  tags = {
    Environment = var.env
  }
}
