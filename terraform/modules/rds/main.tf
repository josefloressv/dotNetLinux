resource "aws_db_instance" "main" {
    engine                                = var.engine
    engine_version                        = var.engine_version
    identifier                            = local.name_prefix
    instance_class                        = var.instance_class
    allocated_storage                     = var.allocated_storage
    auto_minor_version_upgrade            = false # Upgrade should be controled by us
    availability_zone                     = var.availability_zone
    copy_tags_to_snapshot                 = true
    db_subnet_group_name                  = aws_db_subnet_group.main.name
    delete_automated_backups              = true
    deletion_protection                   = false
    port                                  = 1433
    publicly_accessible                   = true # RDS should be accessible from the internet for this demo
    skip_final_snapshot                   = true
    storage_encrypted                     = false # DB Engine sqlserver-ex does not support encryption at rest
    multi_az                              = false
    tags                                  = var.tags
    # db_name                               = var.db_name #  DBName must be null for engine: sqlserver-ex
    username                              = var.username
    manage_master_user_password           = true
    vpc_security_group_ids                = [aws_security_group.db.id]
    apply_immediately                     = true
    allow_major_version_upgrade           = false
    # lifecycle {
    #     ignore_changes = [
    #         db_name,
    #         username,
    #     ]
    # }
}
