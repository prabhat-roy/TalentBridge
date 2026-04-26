variable "environment" { type = string  default = "prod" }

# Per-region settings — one EKS cluster + one RDS per residency region.
variable "region_eu"  { type = string  default = "eu-west-1" }     # GDPR
variable "region_in"  { type = string  default = "ap-south-1" }    # India
variable "region_us"  { type = string  default = "us-east-1" }     # USA

variable "vpc_cidr_eu" { type = string  default = "10.40.0.0/16" }
variable "vpc_cidr_in" { type = string  default = "10.41.0.0/16" }
variable "vpc_cidr_us" { type = string  default = "10.42.0.0/16" }

variable "az_count"      { type = number default = 3 }
variable "eks_version"   { type = string default = "1.31" }
variable "node_min"      { type = number default = 3 }
variable "node_max"      { type = number default = 30 }
variable "node_instance" { type = string default = "m6i.xlarge" }

variable "rds_engine_version" { type = string default = "16.3" }
variable "rds_instance"       { type = string default = "db.r6g.large" }
variable "rds_storage_gb"     { type = number default = 200 }

variable "kafka_version"         { type = string default = "3.7.x" }
variable "kafka_broker_count"    { type = number default = 3 }
variable "kafka_broker_instance" { type = string default = "kafka.m5.large" }

variable "redis_node_type" { type = string default = "cache.r6g.large" }
variable "redis_num_nodes" { type = number default = 2 }
