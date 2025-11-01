module "ec2" {
  source  = "leedonggyu-terraform-factory/ec2/resource"
  version = "4.0.0"

  items = {
    "webhook_relay" = {
        "vpc_id" = local.vpc_id
        "subnet_id" = local.private_subnets[0]
        "public_ip" = false
        "user_data" = ""

    },
    "atlantis" = {
      "vpc_id" = local.vpc_id
      "subnet_id" = local.private_subnets[0]
      "public_ip" = false
      "user_data" = ""
    }
  }
  # insert the 1 required variable here
}