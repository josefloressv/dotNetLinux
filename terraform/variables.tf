#region Dynamic variables from deploy-infra.sh
variable "aws_region" {
  type = string
}

variable "platform" {
  type = string
}

variable "environment" {
  type = string
}
#endregion

#region Network
variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
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
#endregion
