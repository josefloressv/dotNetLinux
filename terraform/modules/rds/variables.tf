#region Network
variable "vpc_id" {
    description = "The VPC ID"
    type        = string
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}
#endregion

#region RDS Instance
variable "engine" {
  description = "The database engine to use for the RDS instance"
  type        = string
}
variable "engine_version" {
    description = "The engine version for the RDS instance"
    type        = string
}

variable "instance_class" {
    description = "The instance class for the RDS instance"
    type        = string
}
variable "db_name" {
    description = "The name of the database to create"
    type        = string
}

variable "username" {
    description = "The username for the RDS instance"
    type        = string
}

variable "allocated_storage" {
    description = "The allocated storage for the RDS instance"
    type        = number
}

variable "availability_zone" {
    description = "The availability zone for the RDS instance"
    type        = string
}

variable "tags" {
    description = "The tags for the RDS instance"
    type        = map(string)
}
#endregion

#region Subnet Group
variable "db_subnet_ids" {
    description = "List of subnet IDs for the DB subnet group"
    type        = list(string)
}
#endregion
