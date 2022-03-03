# Terraform Modules from external registry

[Documentation of S3 Bucket module](https://registry.terraform.io/modules/terraform-aws-
modules/s3-bucket/aws/latest)

Look at the “Input” section of the documentation to get all the required and the
optional fields and update accordingly to above code.

Execute Terraform flow:

```
terraform init
terraform plan
terraform apply
```

This will create an S3 bucket in your AWS account.
