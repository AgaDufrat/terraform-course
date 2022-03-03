module "uk-application" {
  source = "../payroll-app-template"
  app_region = "us-east-1"
  bucket = "us-payroll-app-273463634643"
  ami = "ami-083602cee93914c0c"
}
