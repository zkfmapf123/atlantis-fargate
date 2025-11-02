resource "aws_security_group" "ex-1" {
  name = "ex-10"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-2" {
  name = "ex-11"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-3" {
  name = "ex-12"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}

resource "aws_security_group" "ex-4" {
  name = "ex-13"
  description = "Example Security Group"
  vpc_id = local.vpc_id  
}