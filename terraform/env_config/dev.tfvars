# Network
vpc_cidr = "172.31.0.0/16"

vpc_id     = "vpc-041a81b2c9b992ea3"
subnet_ids = ["subnet-0fddf34b89d35284b", "subnet-03d4296b73b7edbee"] # Public Subnets us-east-1a and us-east-1b

# RDS Instance
engine            = "sqlserver-ex"
engine_version    = "15.00.4410.1.v1"
instance_class    = "db.t3.medium"
db_name           = "db01"
username          = "admin"
allocated_storage = 30
availability_zone = "us-east-1a"
