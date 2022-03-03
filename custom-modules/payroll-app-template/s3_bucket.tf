resource "aws_s3_bucket" "app_data" {
  bucket = "${var.app_region}-${var.bucket}"
}
