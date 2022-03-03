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
provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
