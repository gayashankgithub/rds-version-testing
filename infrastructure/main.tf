locals {
  engine    = "aurora-postgresql"
  version   = "13"
  port      = "5432"
  stack     = "${var.stack}-${var.environment}"
  db_family = "aurora-postgresql13"

  tags = {
    "Department"             = "AE"
    "Deployment_Environment" = var.environment == "production" ? "Production" : "Non-Production"
    "Stack"                  = local.stack
    "Spend_Category"         = "ACI"
    "Spend_Category_DL"      = "testdl"
    "Spend_Category_DRI"     = "gayashankgithub"
  }
}

resource "random_password" "pass_master" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

data "aws_security_group" "rds_postgres" {
  name = var.postgres_security_group_name
}

module "postgres_aurora_serverless" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "7.6.2"

  name = local.stack

  engine            = local.engine
  engine_version    = local.version
  engine_mode       = "provisioned"
  storage_encrypted = true

  master_username = "DBAdmin"
  master_password = random_password.pass_master.result
  port            = local.port

  vpc_id                = var.vpc_id
  allowed_cidr_blocks   = var.vpc_id_cidr
  subnets               = var.private_subnets
  create_security_group = false

  vpc_security_group_ids = [
    data.aws_security_group.rds_postgres.id
  ]

  serverlessv2_scaling_configuration = {
    min_capacity = 1
    max_capacity = 2
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }

  create_db_parameter_group         = false
  create_db_cluster_parameter_group = false

  db_parameter_group_name         = "default.aurora-postgresql13"
  db_cluster_parameter_group_name = "default.aurora-postgresql13"

}