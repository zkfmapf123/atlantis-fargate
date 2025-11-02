resource "aws_security_group" "ex-1" {
  name = "ex-101"
  description = "Example Security Group"
  vpc_id = local.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ex-2" {
  name = "ex-102"
  description = "Example Security Group"
  vpc_id = local.vpc_id  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ex-3" {
  name = "ex-103"
  description = "Example Security Group"
  vpc_id = local.vpc_id  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ex-4" {
  name = "ex-104"
  description = "Example Security Group"
  vpc_id = local.vpc_id  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}