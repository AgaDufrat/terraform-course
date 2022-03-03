# Create public NACL and
# add inbound rule to allow HTTP (80) and RDP (3389) conncections from anywhere

resource "aws_network_acl" "public_acl" {
  vpc_id = aws_vpc.main.id
  subnet_ids = [aws_subnet.public_subnet.id]

  tags = {
    Name = "public_acl"
  }
}

resource "aws_network_acl_rule" "public_acl_rule1" {
  network_acl_id = aws_network_acl.public_acl.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0" # from anywhere
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_acl_rule2" {
  network_acl_id = aws_network_acl.public_acl.id
  rule_number    = 2
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0" # from anywhere
  from_port      = 22
  to_port        = 22
}

# Create private NACL and
# add inbound rule to allow RDP (3389) only from private IPs created for the VPC
resource "aws_network_acl" "private_acl" {
  vpc_id = aws_vpc.main.id
  subnet_ids = [aws_subnet.private_subnet.id]

  tags = {
    Name = "private_acl"
  }
}

resource "aws_network_acl_rule" "private_nacl_rule2" {
  network_acl_id = aws_network_acl.private_acl.id
  rule_number    = 3
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = aws_vpc.main.cidr_block
  from_port      = 22
  to_port        = 22
}

# Add outbound rule tto allow all traffic in both public and private NACL

resource "aws_network_acl_rule" "public_outbound_rule1" {
  network_acl_id = aws_network_acl.public_acl.id
  rule_number    = 4
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_outbound_rule1" {
  network_acl_id = aws_network_acl.private_acl.id
  rule_number    = 5
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}
