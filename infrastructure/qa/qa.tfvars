vpc_id      = "your-vpc" # dev-vpc
vpc_id_cidr = ["10.0.0.0/8"]

private_subnets = [
  "your-subnet-1", # us-east-1a
  "your-subnet-2", # us-east-1b
  "your-subnet-3"  # us-east-1d
]

stack       = "test-rds-versioning"
environment = "test"
