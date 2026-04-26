terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws        = { source = "hashicorp/aws",        version = "~> 5.70" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.15" }
    random     = { source = "hashicorp/random",     version = "~> 3.6" }
  }
  backend "s3" {
    bucket         = "talentbridge-tfstate-aws"
    key            = "talentbridge/aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "talentbridge-tfstate-locks"
    encrypt        = true
  }
}

# Multi-region providers — every PII region (EU, India, US) gets its own EKS cluster
# and its own RDS so employee data stays in jurisdiction.
provider "aws" {
  alias  = "eu"
  region = var.region_eu
  default_tags { tags = { Project = "talentbridge", Environment = var.environment, Cloud = "aws", ResidencyRegion = "eu" } }
}

provider "aws" {
  alias  = "in"
  region = var.region_in
  default_tags { tags = { Project = "talentbridge", Environment = var.environment, Cloud = "aws", ResidencyRegion = "in" } }
}

provider "aws" {
  alias  = "us"
  region = var.region_us
  default_tags { tags = { Project = "talentbridge", Environment = var.environment, Cloud = "aws", ResidencyRegion = "us" } }
}
