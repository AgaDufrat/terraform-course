module "ec2Instance-us" {

    source = "../module-ec2"

    # ami = "ami-083602cee93914c0c"

    app_region = "us-east-1"

    instance_type = "t2.micro"

    # ami = var.ami_image[count.index]
    # count = length(var.ami_image)

    ami = each.value
    for_each = var.ami_image
}
# foe `count`
# variable "ami_image" {
#   type = list(string)
#   value = [
#     "ami-083602cee93914c0c",
#     "ami-0fdbd8587b1cf431e",
#     "ami-0cf5e24570c2b477b"
#   ]
# }

# for `for_each`
variable "ami_image" {
  type = set(string)
  default = [
    "ami-083602cee93914c0c",
    "ami-0fdbd8587b1cf431e",
    "ami-0cf5e24570c2b477b"
  ]
}

# Bacause Providers cannot be configured within modules using count, for_each or depends_on.
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
