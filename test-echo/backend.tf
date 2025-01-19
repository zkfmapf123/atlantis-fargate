terraform {
  backend "s3" {
    bucket  = "dk-state-bucket"
    key     = "test-echo/terraform.tfstate"
    region  = "ap-northeast-2"
    profile = "leedonggyu"
  }
}