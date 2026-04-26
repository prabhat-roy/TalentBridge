resource "google_kms_key_ring" "eu" { provider = google.eu  name = "talentbridge-eu-${var.environment}"  location = var.region_eu }
resource "google_kms_key_ring" "in" { provider = google.in  name = "talentbridge-in-${var.environment}"  location = var.region_in }
resource "google_kms_key_ring" "us" { provider = google.us  name = "talentbridge-us-${var.environment}"  location = var.region_us }

resource "google_secret_manager_secret" "pg_eu" { secret_id = "talentbridge-eu-${var.environment}-postgres"  replication { user_managed { replicas { location = var.region_eu } } } }
resource "google_secret_manager_secret_version" "pg_eu" { secret = google_secret_manager_secret.pg_eu.id  secret_data = jsonencode({ username = google_sql_user.eu.name, password = random_password.pg_eu.result, instance = google_sql_database_instance.eu.connection_name, dbname = google_sql_database.eu.name }) }

resource "google_secret_manager_secret" "pg_in" { secret_id = "talentbridge-in-${var.environment}-postgres"  replication { user_managed { replicas { location = var.region_in } } } }
resource "google_secret_manager_secret_version" "pg_in" { secret = google_secret_manager_secret.pg_in.id  secret_data = jsonencode({ username = google_sql_user.in.name, password = random_password.pg_in.result, instance = google_sql_database_instance.in.connection_name, dbname = google_sql_database.in.name }) }

resource "google_secret_manager_secret" "pg_us" { secret_id = "talentbridge-us-${var.environment}-postgres"  replication { user_managed { replicas { location = var.region_us } } } }
resource "google_secret_manager_secret_version" "pg_us" { secret = google_secret_manager_secret.pg_us.id  secret_data = jsonencode({ username = google_sql_user.us.name, password = random_password.pg_us.result, instance = google_sql_database_instance.us.connection_name, dbname = google_sql_database.us.name }) }
