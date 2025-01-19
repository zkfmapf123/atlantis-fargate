terraform {
  backend "s3" {
    bucket  = "dk-state-bucket"
    key     = "vpc/terraform.tfstate"
    region  = "ap-northeast-2"
    profile = "leedonggyu"
  }
}