module "ec2" {
  source  = "leedonggyu-terraform-factory/ec2/resource"
  version = "4.0.1"

  items = {
    "test-1" : {  
      "instance_type" = "t4g.micro"
      "vpc_id" = local.vpc_id
      "subnet_id" = local.private_subnets[0]
      "public_ip" = false
      "user_data" = ""
    },
    "test-2" : {
      "instance_type" = "t4g.micro"
      "vpc_id" = local.vpc_id
      "subnet_id" = local.private_subnets[0]
      "public_ip" = false
      "user_data" = ""
    }
  }
}