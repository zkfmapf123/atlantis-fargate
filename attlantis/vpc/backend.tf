terraform {
  backend "s3" {
    bucket       = "dk-state-bucket"
    key          = "vpc/terraform.tfstate"
    region       = "ap-northeast-2"
    use_lockfile = true

    assume_role = {
      role_arn = "arn:aws:iam::182024812696:role/TerraformAssumedRole"
    }
  }
}