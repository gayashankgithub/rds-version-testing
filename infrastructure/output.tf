output "aurora_postgresql_v2_cluster_master_username" {
  value     = module.postgres_aurora_serverless.cluster_master_username
  sensitive = true
}

output "aurora_postgresql_v2_cluster_master_password" {
  value     = module.postgres_aurora_serverless.cluster_master_password
  sensitive = true
}

output "aurora_postgresql_v2_cluster_endpoint" {
  value = module.postgres_aurora_serverless.cluster_endpoint
}

output "aurora_postgresql_v2_cluster_port" {
  value = module.postgres_aurora_serverless.cluster_port
}

