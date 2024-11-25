resource "aws_security_group" "db" {
  vpc_id = var.vpc_id
  name   = "${local.name_prefix}-db"

  ingress {
    description = "Allow SQL Server Inbound From Internet"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [var.vpc_cidr]
  }

  tags = merge(var.tags, {
    Name = "${local.name_prefix}-db"
  })
}
