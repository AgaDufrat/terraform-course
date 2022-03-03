variable "ami" {
  type = string
  description = "This variable holds the ami image id"
}

variable "app_region" {
  
  type = string
  default = "us-east-1"

}

variable "instance_type" {

    type = string
  
}