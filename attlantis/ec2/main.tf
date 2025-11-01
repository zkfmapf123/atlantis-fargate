module "ec2" {
  source  = "leedonggyu-terraform-factory/ec2/resource"
  version = "4.0.0"

  items = {
    "webhook_relay" = {
        "ami" = "ami-0cf1ead55e8259a57"
        "instance_type" = "t3.micro"
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