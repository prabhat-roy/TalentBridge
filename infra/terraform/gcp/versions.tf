terraform {
  required_version = ">= 1.9.0"
  required_providers {
    google      = { source = "hashicorp/google",      version = "~> 6.5" }
    google-beta = { source = "hashicorp/google-beta", version = "~> 6.5" }
    kubernetes  = { source = "hashicorp/kubernetes",  version = "~> 2.32" }
    helm        = { source = "hashicorp/helm",        version = "~> 2.15" }
    random      = { source = "hashicorp/random",      version = "~> 3.6" }
  }
  backend "gcs" { bucket = "talentbridge-tfstate-gcp"  prefix = "talentbridge/gcp" }
}

provider "google"      { alias = "eu"  project = var.gcp_project  region = var.region_eu }
provider "google"      { alias = "in"  project = var.gcp_project  region = var.region_in }
provider "google"      { alias = "us"  project = var.gcp_project  region = var.region_us }
provider "google-beta" { alias = "eu"  project = var.gcp_project  region = var.region_eu }
provider "google-beta" { alias = "in"  project = var.gcp_project  region = var.region_in }
provider "google-beta" { alias = "us"  project = var.gcp_project  region = var.region_us }
