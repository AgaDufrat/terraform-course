resource "aws_instance" "public_ec2" {
  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "terraform-public-ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami           = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "terraform-private-ec2"
  }
}
