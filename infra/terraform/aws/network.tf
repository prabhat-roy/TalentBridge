# Three independent VPCs, one per residency region. No VPC peering between
# regions — Cilium NetPol + AWS account boundary keep employee PII in-region.

# ---------------- EU (eu-west-1) ----------------
data "aws_availability_zones" "eu" { provider = aws.eu  state = "available" }

resource "aws_vpc" "eu" {
  provider             = aws.eu
  cidr_block           = var.vpc_cidr_eu
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "talentbridge-eu-${var.environment}", ResidencyRegion = "eu" }
}

resource "aws_subnet" "eu_private" {
  provider                = aws.eu
  count                   = var.az_count
  vpc_id                  = aws_vpc.eu.id
  availability_zone       = data.aws_availability_zones.eu.names[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr_eu, 4, count.index)
  map_public_ip_on_launch = false
  tags = { Name = "tb-eu-private-${count.index}", "kubernetes.io/role/internal-elb" = "1" }
}

# ---------------- India (ap-south-1) ----------------
data "aws_availability_zones" "in" { provider = aws.in  state = "available" }

resource "aws_vpc" "in" {
  provider             = aws.in
  cidr_block           = var.vpc_cidr_in
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "talentbridge-in-${var.environment}", ResidencyRegion = "in" }
}

resource "aws_subnet" "in_private" {
  provider                = aws.in
  count                   = var.az_count
  vpc_id                  = aws_vpc.in.id
  availability_zone       = data.aws_availability_zones.in.names[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr_in, 4, count.index)
  map_public_ip_on_launch = false
  tags = { Name = "tb-in-private-${count.index}", "kubernetes.io/role/internal-elb" = "1" }
}

# ---------------- USA (us-east-1) ----------------
data "aws_availability_zones" "us" { provider = aws.us  state = "available" }

resource "aws_vpc" "us" {
  provider             = aws.us
  cidr_block           = var.vpc_cidr_us
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "talentbridge-us-${var.environment}", ResidencyRegion = "us" }
}

resource "aws_subnet" "us_private" {
  provider                = aws.us
  count                   = var.az_count
  vpc_id                  = aws_vpc.us.id
  availability_zone       = data.aws_availability_zones.us.names[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr_us, 4, count.index)
  map_public_ip_on_launch = false
  tags = { Name = "tb-us-private-${count.index}", "kubernetes.io/role/internal-elb" = "1" }
}
