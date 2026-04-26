# Per-region KMS + Secrets Manager. Payslip signing keys are HSM-backed
# and never leave the region.
resource "aws_kms_key" "tb_eu" { provider = aws.eu  description = "talentbridge eu KMS"  deletion_window_in_days = 30  enable_key_rotation = true }
resource "aws_kms_alias" "tb_eu" { provider = aws.eu  name = "alias/talentbridge-eu-${var.environment}"  target_key_id = aws_kms_key.tb_eu.id }
resource "aws_secretsmanager_secret" "pg_eu" { provider = aws.eu  name = "talentbridge/${var.environment}/eu/postgres"  kms_key_id = aws_kms_key.tb_eu.arn }
resource "aws_secretsmanager_secret_version" "pg_eu" {
  provider = aws.eu  secret_id = aws_secretsmanager_secret.pg_eu.id
  secret_string = jsonencode({ username = aws_db_instance.postgres_eu.username, password = random_password.pg_eu.result, host = aws_db_instance.postgres_eu.address, port = aws_db_instance.postgres_eu.port, dbname = aws_db_instance.postgres_eu.db_name })
}

resource "aws_kms_key" "tb_in" { provider = aws.in  description = "talentbridge in KMS"  deletion_window_in_days = 30  enable_key_rotation = true }
resource "aws_kms_alias" "tb_in" { provider = aws.in  name = "alias/talentbridge-in-${var.environment}"  target_key_id = aws_kms_key.tb_in.id }
resource "aws_secretsmanager_secret" "pg_in" { provider = aws.in  name = "talentbridge/${var.environment}/in/postgres"  kms_key_id = aws_kms_key.tb_in.arn }
resource "aws_secretsmanager_secret_version" "pg_in" {
  provider = aws.in  secret_id = aws_secretsmanager_secret.pg_in.id
  secret_string = jsonencode({ username = aws_db_instance.postgres_in.username, password = random_password.pg_in.result, host = aws_db_instance.postgres_in.address, port = aws_db_instance.postgres_in.port, dbname = aws_db_instance.postgres_in.db_name })
}

resource "aws_kms_key" "tb_us" { provider = aws.us  description = "talentbridge us KMS"  deletion_window_in_days = 30  enable_key_rotation = true }
resource "aws_kms_alias" "tb_us" { provider = aws.us  name = "alias/talentbridge-us-${var.environment}"  target_key_id = aws_kms_key.tb_us.id }
resource "aws_secretsmanager_secret" "pg_us" { provider = aws.us  name = "talentbridge/${var.environment}/us/postgres"  kms_key_id = aws_kms_key.tb_us.arn }
resource "aws_secretsmanager_secret_version" "pg_us" {
  provider = aws.us  secret_id = aws_secretsmanager_secret.pg_us.id
  secret_string = jsonencode({ username = aws_db_instance.postgres_us.username, password = random_password.pg_us.result, host = aws_db_instance.postgres_us.address, port = aws_db_instance.postgres_us.port, dbname = aws_db_instance.postgres_us.db_name })
}
