resource "aws_security_group" "ex-1" {
  name = "ex-1"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-2" {
  name = "ex-2"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-3" {
  name = "ex-3"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-4" {
  name = "ex-3"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}