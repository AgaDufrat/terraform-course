resource "aws_dynamodb_table" "dynamo_db" {
    name = "user_data"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "EmployeeID"

    attribute {
      name = "EmployeeID"
      type = "N"
    }
}
