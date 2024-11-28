# Network
vpc_cidr = "172.31.0.0/16"

vpc_id     = "vpc-0ce8d348680417217"
subnet_ids = ["subnet-0da50e598a7f34759", "subnet-0dbc379791a9edd2c"] # Public Subnets us-east-1a and us-east-1b

# RDS Instance
engine            = "sqlserver-ex"
engine_version    = "15.00.4410.1.v1"
instance_class    = "db.t3.medium"
db_name           = "db01"
username          = "admin"
allocated_storage = 30
availability_zone = "us-east-1a"
