resource "google_container_cluster" "eu" {
  provider = google.eu  name = "talentbridge-eu-${var.environment}"  location = var.region_eu
  network = google_compute_network.eu.self_link  subnetwork = google_compute_subnetwork.eu.self_link
  initial_node_count = 1  remove_default_node_pool = true
  release_channel { channel = "REGULAR" }
  ip_allocation_policy { cluster_secondary_range_name = "pods" services_secondary_range_name = "svcs" }
  workload_identity_config { workload_pool = "${var.gcp_project}.svc.id.goog" }
}
resource "google_container_node_pool" "eu_default" {
  provider = google.eu  name = "default"  cluster = google_container_cluster.eu.id  location = var.region_eu
  autoscaling { min_node_count = var.node_min  max_node_count = var.node_max }
  node_config { machine_type = var.node_machine  disk_size_gb = 100  workload_metadata_config { mode = "GKE_METADATA" }  oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"] }
}

resource "google_container_cluster" "in" {
  provider = google.in  name = "talentbridge-in-${var.environment}"  location = var.region_in
  network = google_compute_network.in.self_link  subnetwork = google_compute_subnetwork.in.self_link
  initial_node_count = 1  remove_default_node_pool = true
  release_channel { channel = "REGULAR" }
  ip_allocation_policy { cluster_secondary_range_name = "pods" services_secondary_range_name = "svcs" }
  workload_identity_config { workload_pool = "${var.gcp_project}.svc.id.goog" }
}
resource "google_container_node_pool" "in_default" {
  provider = google.in  name = "default"  cluster = google_container_cluster.in.id  location = var.region_in
  autoscaling { min_node_count = var.node_min  max_node_count = var.node_max }
  node_config { machine_type = var.node_machine  disk_size_gb = 100  workload_metadata_config { mode = "GKE_METADATA" }  oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"] }
}

resource "google_container_cluster" "us" {
  provider = google.us  name = "talentbridge-us-${var.environment}"  location = var.region_us
  network = google_compute_network.us.self_link  subnetwork = google_compute_subnetwork.us.self_link
  initial_node_count = 1  remove_default_node_pool = true
  release_channel { channel = "REGULAR" }
  ip_allocation_policy { cluster_secondary_range_name = "pods" services_secondary_range_name = "svcs" }
  workload_identity_config { workload_pool = "${var.gcp_project}.svc.id.goog" }
}
resource "google_container_node_pool" "us_default" {
  provider = google.us  name = "default"  cluster = google_container_cluster.us.id  location = var.region_us
  autoscaling { min_node_count = var.node_min  max_node_count = var.node_max }
  node_config { machine_type = var.node_machine  disk_size_gb = 100  workload_metadata_config { mode = "GKE_METADATA" }  oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"] }
}
