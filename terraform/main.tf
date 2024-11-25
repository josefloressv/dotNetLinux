module "sqlserver_db_primary" {
  source = "./modules/rds"

  # Network
  vpc_cidr = var.vpc_cidr
  vpc_id   = var.vpc_id

  # RDS Instance
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name           = var.db_name
  username          = var.username
  allocated_storage = var.allocated_storage
  availability_zone = var.availability_zone

  # Subnet Group
  db_subnet_ids = var.subnet_ids

  tags = local.common_tags
}