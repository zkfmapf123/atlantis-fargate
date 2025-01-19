module "vpc" {
  source = "zkfmapf123/vpc3tier/lee"

  vpc_cidr      = "10.10.0.0/16"
  is_enable_nat = false
  prefix        = "attalntis"
  vpc_name      = "network"
  vpc_region    = "ap-northeast-2"

  webserver_subnets = {
    "a" : "10.10.1.0/24",
    "b" : "10.10.2.0/24"
  }
  was_subnets       = {
    "a" : "10.10.3.0/24",
    "b" : "10.10.4.0/24"
  }
  db_subnets        = {
    "a" : "10.10.5.0/24",
    "b" : "10.10.6.0/24"
  }

  endpoint_setting = {
    "apigateway_is_enable" : false,
    "codepipeline_is_enable" : false,
    "ecr_is_enable" : false,
    "s3_is_enable" : false,
    "sqs_is_enable" : false
  }
}

output out {
    value = module.vpc
}