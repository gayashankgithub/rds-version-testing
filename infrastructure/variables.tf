variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_id_cidr" {
  description = "VPC cidr"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}

variable "stack" {
  description = "Database stack Name"
  type        = string
}

variable "environment" {
  description = "Database environment"
  type        = string
}

variable "postgres_security_group_name" {
  description = "postgres security group created for postgres rds."
  type        = string
  default     = "aci-rds-postgres"
}
