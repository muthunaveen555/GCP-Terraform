resource "aws_vpc" "my-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "edureka-demo-practice"
  }
}
output "aws_vpc_id" {
  value = aws_vpc.my-vpc.id
}

resource "aws_security_group" "my-private-sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = aws_vpc.my-vpc.id
  name        = "naveen-private-sg"

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3306
    to_port     = 3306
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3389
    to_port     = 3389
  }

  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "ec2-private-sg"
  }
}
resource "aws_security_group" "my-public-sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = aws_vpc.my-vpc.id
  name        = "naveen-public-sg"

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "ec2-public-sg"
  }
}
output "aws-sg-private-id" {
  value = aws_security_group.my-private-sg.id
}

output "aws-sg-public-id" {
  value = aws_security_group.my-public-sg.id
}
