module "uk-application" {
  source = "../payroll-app-template"
  app_region = "eu-west-2"
  bucket = "payroll-app-uk-38yy4354y"

  ami = "ami-0015a39e4b7c0966f"
  # 
  # ami = var.ami_image[count.index]
  # count = length(var.ami_image)
}
