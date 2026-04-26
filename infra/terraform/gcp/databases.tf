# Per-region Cloud SQL Postgres + Memorystore Redis. Employee PII never crosses regions.
resource "random_password" "pg_eu" { length = 32 special = false }
resource "random_password" "pg_in" { length = 32 special = false }
resource "random_password" "pg_us" { length = 32 special = false }

resource "google_sql_database_instance" "eu" {
  provider = google-beta.eu  name = "talentbridge-eu-${var.environment}"  database_version = var.pg_version  region = var.region_eu  deletion_protection = true
  settings {
    tier = var.pg_tier
    backup_configuration { enabled = true  point_in_time_recovery_enabled = true  transaction_log_retention_days = 7 }
    insights_config { query_insights_enabled = true }
  }
}
resource "google_sql_user" "eu" { provider = google-beta.eu  name = "talentbridge"  instance = google_sql_database_instance.eu.name  password = random_password.pg_eu.result }
resource "google_sql_database" "eu" { provider = google-beta.eu  name = "talentbridge"  instance = google_sql_database_instance.eu.name }

resource "google_sql_database_instance" "in" {
  provider = google-beta.in  name = "talentbridge-in-${var.environment}"  database_version = var.pg_version  region = var.region_in  deletion_protection = true
  settings { tier = var.pg_tier  backup_configuration { enabled = true  point_in_time_recovery_enabled = true  transaction_log_retention_days = 7 } }
}
resource "google_sql_user" "in" { provider = google-beta.in  name = "talentbridge"  instance = google_sql_database_instance.in.name  password = random_password.pg_in.result }
resource "google_sql_database" "in" { provider = google-beta.in  name = "talentbridge"  instance = google_sql_database_instance.in.name }

resource "google_sql_database_instance" "us" {
  provider = google-beta.us  name = "talentbridge-us-${var.environment}"  database_version = var.pg_version  region = var.region_us  deletion_protection = true
  settings { tier = var.pg_tier  backup_configuration { enabled = true  point_in_time_recovery_enabled = true  transaction_log_retention_days = 7 } }
}
resource "google_sql_user" "us" { provider = google-beta.us  name = "talentbridge"  instance = google_sql_database_instance.us.name  password = random_password.pg_us.result }
resource "google_sql_database" "us" { provider = google-beta.us  name = "talentbridge"  instance = google_sql_database_instance.us.name }

resource "google_redis_instance" "eu" { provider = google.eu  name = "talentbridge-eu-${var.environment}"  tier = "STANDARD_HA"  memory_size_gb = var.redis_size_gb  region = var.region_eu  redis_version = "REDIS_7_0"  transit_encryption_mode = "SERVER_AUTHENTICATION" }
resource "google_redis_instance" "in" { provider = google.in  name = "talentbridge-in-${var.environment}"  tier = "STANDARD_HA"  memory_size_gb = var.redis_size_gb  region = var.region_in  redis_version = "REDIS_7_0"  transit_encryption_mode = "SERVER_AUTHENTICATION" }
resource "google_redis_instance" "us" { provider = google.us  name = "talentbridge-us-${var.environment}"  tier = "STANDARD_HA"  memory_size_gb = var.redis_size_gb  region = var.region_us  redis_version = "REDIS_7_0"  transit_encryption_mode = "SERVER_AUTHENTICATION" }
