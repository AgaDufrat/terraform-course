resource "aws_instance" "payroll_app" {
    ami = var.ami
    instance_type = "t2.micro"
    tags = {
        Name = "${var.app_region}-app-server"
    }

    depends_on = [
      aws_dynamodb_table.dynamo_db,
      aws_s3_bucket.app_data
    ]
}
