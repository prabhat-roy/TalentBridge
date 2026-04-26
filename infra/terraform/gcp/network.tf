# Three regional VPCs (one per residency region) with strict regional routing.
resource "google_compute_network" "eu" { provider = google.eu  name = "talentbridge-eu-${var.environment}"  auto_create_subnetworks = false  routing_mode = "REGIONAL" }
resource "google_compute_subnetwork" "eu" {
  provider      = google.eu  name = "talentbridge-eu-${var.environment}"  ip_cidr_range = var.subnet_cidr_eu
  region        = var.region_eu  network = google_compute_network.eu.id
  secondary_ip_range { range_name = "pods" ip_cidr_range = "10.60.0.0/14" }
  secondary_ip_range { range_name = "svcs" ip_cidr_range = "10.64.0.0/16" }
  private_ip_google_access = true
}

resource "google_compute_network" "in" { provider = google.in  name = "talentbridge-in-${var.environment}"  auto_create_subnetworks = false  routing_mode = "REGIONAL" }
resource "google_compute_subnetwork" "in" {
  provider      = google.in  name = "talentbridge-in-${var.environment}"  ip_cidr_range = var.subnet_cidr_in
  region        = var.region_in  network = google_compute_network.in.id
  secondary_ip_range { range_name = "pods" ip_cidr_range = "10.68.0.0/14" }
  secondary_ip_range { range_name = "svcs" ip_cidr_range = "10.72.0.0/16" }
  private_ip_google_access = true
}

resource "google_compute_network" "us" { provider = google.us  name = "talentbridge-us-${var.environment}"  auto_create_subnetworks = false  routing_mode = "REGIONAL" }
resource "google_compute_subnetwork" "us" {
  provider      = google.us  name = "talentbridge-us-${var.environment}"  ip_cidr_range = var.subnet_cidr_us
  region        = var.region_us  network = google_compute_network.us.id
  secondary_ip_range { range_name = "pods" ip_cidr_range = "10.76.0.0/14" }
  secondary_ip_range { range_name = "svcs" ip_cidr_range = "10.80.0.0/16" }
  private_ip_google_access = true
}
