output "gke_eu" { value = google_container_cluster.eu.name }
output "gke_in" { value = google_container_cluster.in.name }
output "gke_us" { value = google_container_cluster.us.name }
output "postgres" { value = { eu = google_sql_database_instance.eu.connection_name, in = google_sql_database_instance.in.connection_name, us = google_sql_database_instance.us.connection_name } sensitive = true }
output "documents_buckets" { value = { eu = google_storage_bucket.documents_eu.name, in = google_storage_bucket.documents_in.name, us = google_storage_bucket.documents_us.name } }
