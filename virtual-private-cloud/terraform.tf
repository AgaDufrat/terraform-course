terraform {
  backend "s3" {
    bucket = "terraform-state-file-aga"
    key = "statefile/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "state-locking"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}
