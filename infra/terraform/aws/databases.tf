# One RDS Postgres + one ElastiCache Redis + one MSK Kafka per residency region.
# Employee PII never crosses regions. No cross-region read replicas of PII tables.

# ---------------- EU ----------------
resource "aws_db_subnet_group" "pg_eu" { provider = aws.eu  name = "talentbridge-eu-${var.environment}"  subnet_ids = aws_subnet.eu_private[*].id }
resource "random_password" "pg_eu"    { length = 32  special = true }
resource "aws_db_instance" "postgres_eu" {
  provider                  = aws.eu
  identifier                = "talentbridge-eu-${var.environment}"
  engine                    = "postgres"
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance
  allocated_storage         = var.rds_storage_gb
  storage_encrypted         = true
  db_name                   = "talentbridge"
  username                  = "talentbridge"
  password                  = random_password.pg_eu.result
  db_subnet_group_name      = aws_db_subnet_group.pg_eu.name
  multi_az                  = true
  backup_retention_period   = 14
  deletion_protection       = true
  performance_insights_enabled = true
  skip_final_snapshot       = false
  final_snapshot_identifier = "talentbridge-eu-${var.environment}-final"
  tags = { ResidencyRegion = "eu" }
}

# ---------------- India ----------------
resource "aws_db_subnet_group" "pg_in" { provider = aws.in  name = "talentbridge-in-${var.environment}"  subnet_ids = aws_subnet.in_private[*].id }
resource "random_password" "pg_in"    { length = 32  special = true }
resource "aws_db_instance" "postgres_in" {
  provider                  = aws.in
  identifier                = "talentbridge-in-${var.environment}"
  engine                    = "postgres"
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance
  allocated_storage         = var.rds_storage_gb
  storage_encrypted         = true
  db_name                   = "talentbridge"
  username                  = "talentbridge"
  password                  = random_password.pg_in.result
  db_subnet_group_name      = aws_db_subnet_group.pg_in.name
  multi_az                  = true
  backup_retention_period   = 14
  deletion_protection       = true
  skip_final_snapshot       = false
  final_snapshot_identifier = "talentbridge-in-${var.environment}-final"
  tags = { ResidencyRegion = "in" }
}

# ---------------- USA ----------------
resource "aws_db_subnet_group" "pg_us" { provider = aws.us  name = "talentbridge-us-${var.environment}"  subnet_ids = aws_subnet.us_private[*].id }
resource "random_password" "pg_us"    { length = 32  special = true }
resource "aws_db_instance" "postgres_us" {
  provider                  = aws.us
  identifier                = "talentbridge-us-${var.environment}"
  engine                    = "postgres"
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance
  allocated_storage         = var.rds_storage_gb
  storage_encrypted         = true
  db_name                   = "talentbridge"
  username                  = "talentbridge"
  password                  = random_password.pg_us.result
  db_subnet_group_name      = aws_db_subnet_group.pg_us.name
  multi_az                  = true
  backup_retention_period   = 14
  deletion_protection       = true
  skip_final_snapshot       = false
  final_snapshot_identifier = "talentbridge-us-${var.environment}-final"
  tags = { ResidencyRegion = "us" }
}

# Per-region MSK Kafka — payroll-related events stay in region.
resource "aws_msk_cluster" "kafka_eu" {
  provider = aws.eu
  cluster_name = "talentbridge-eu-${var.environment}"
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.kafka_broker_count
  broker_node_group_info { instance_type = var.kafka_broker_instance, client_subnets = aws_subnet.eu_private[*].id, storage_info { ebs_storage_info { volume_size = 1000 } } }
  encryption_info { encryption_in_transit { client_broker = "TLS", in_cluster = true } }
}
resource "aws_msk_cluster" "kafka_in" {
  provider = aws.in
  cluster_name = "talentbridge-in-${var.environment}"
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.kafka_broker_count
  broker_node_group_info { instance_type = var.kafka_broker_instance, client_subnets = aws_subnet.in_private[*].id, storage_info { ebs_storage_info { volume_size = 1000 } } }
  encryption_info { encryption_in_transit { client_broker = "TLS", in_cluster = true } }
}
resource "aws_msk_cluster" "kafka_us" {
  provider = aws.us
  cluster_name = "talentbridge-us-${var.environment}"
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.kafka_broker_count
  broker_node_group_info { instance_type = var.kafka_broker_instance, client_subnets = aws_subnet.us_private[*].id, storage_info { ebs_storage_info { volume_size = 1000 } } }
  encryption_info { encryption_in_transit { client_broker = "TLS", in_cluster = true } }
}
