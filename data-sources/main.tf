variable "vpc_id" {
  default = "vpc-045cde9a809d46c43"
}

data "aws_vpc" "my_terraform_vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = data.aws_vpc.my_terraform_vpc.id
  availability_zone = "us-west-2a"
  cidr_block        = cidrsubnet(data.aws_vpc.my_terraform_vpc.cidr_block, 4, 1)
}

variable "security_group_id" {
  default = "sg-002694c9f25054f49"
}

data "aws_security_group" "my_security_group" {
  id = var.security_group_id
}
