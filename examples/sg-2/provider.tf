provider "aws" {
  region  = "ap-northeast-2"

  assume_role {
    role_arn = "arn:aws:iam::182024812696:role/TerraformAssumedRole"
  }
}

terraform {
  backend "s3" {
    bucket  = "dk-state-bucket"
    key     = "examples/sg-2/terraform.tfstate"
    region  = "ap-northeast-2"
    use_lockfile = true
    
    assume_role = {
      role_arn = "arn:aws:iam::182024812696:role/TerraformAssumedRole"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dk-state-bucket"
    key = "vpc/terraform.tfstate"
    region = "ap-northeast-2"

    assume_role = {
      role_arn = "arn:aws:iam::182024812696:role/TerraformAssumedRole"
    }
  }
}

locals {
  vpc = data.terraform_remote_state.vpc.outputs.out.vpc

  vpc_id = local.vpc.vpc_id
  public_subnets = values(local.vpc.webserver_subnets)
  private_subnets = values(local.vpc.was_subnets)
}
