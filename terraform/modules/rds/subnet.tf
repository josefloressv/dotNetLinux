
resource "aws_db_subnet_group" "main" {
    name        = "${local.name_prefix}-db-subnet-group"
    subnet_ids  = var.db_subnet_ids
    tags        = var.tags
}
