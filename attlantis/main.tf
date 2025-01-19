module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"

  name = "atlantis"

  # ECS Container Definition
  atlantis = {
    environment = [
      {
        name  = "ATLANTIS_GH_USER"
        value = "leedonggyu"
      },
      {
        name  = "ATLANTIS_REPO_ALLOWLIST"
        value = "github.com/zkfmapf123/atlantis-fargate/*"
      },
    ]
    secrets = [
      {
        name      = "ATLANTIS_GH_TOKEN"
        valueFrom = "arn:aws:ssm:ap-northeast-2:182024812696:parameter/GH_TOKEN"
      },
      {
        name      = "ATLANTIS_GH_WEBHOOK_SECRET"
        valueFrom = "arn:aws:ssm:ap-northeast-2:182024812696:parameter/GH_SECRET_KEY"
      },
    ]
  }

  # ECS CLUSTER /  Service
  create_cluster = false
  cluster_arn = "arn:aws:ecs:ap-northeast-2:182024812696:cluster/common-cluster"

  service = {
    assign_public_ip = true
    task_exec_secret_arns = [
      "arn:aws:ssm:ap-northeast-2:182024812696:parameter/GH_TOKEN",
      "arn:aws:ssm:ap-northeast-2:182024812696:parameter/GH_SECRET_KEY"
    ]
    # Provide Atlantis permission necessary to create/destroy resources
    tasks_iam_role_policies = {
      AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
    }
  }
  service_subnets = ["subnet-079d79567c38803e7", "subnet-010f00b9f40d4b952"]
  vpc_id          = "vpc-0b61fb68b5edbdd48"

  # ALB
  alb_subnets             = ["subnet-079d79567c38803e7", "subnet-010f00b9f40d4b952"]

  certificate_arn = var.acm_arn
  certificate_domain_name = "tf.leedonggyu.com"
  route53_zone_id         = var.route53_zone_id

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}