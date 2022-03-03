module "s3_bucket" {
  # https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.13.0"
  bucket = "my-s3-bucket-some-random-string"
  # acceleration_status = "suspended"
  # policy = ""
  # request_payer = ""
  versioning = {
    enabled = true
  }
}
