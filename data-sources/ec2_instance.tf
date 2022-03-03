resource "aws_instance" "public_ec2" {
  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.my_security_group.id]

  tags = {
    Name = "terraform-public-ec2"
  }
}
