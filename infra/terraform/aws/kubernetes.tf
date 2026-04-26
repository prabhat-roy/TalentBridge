# One EKS cluster per residency region — talentbridge-eu / -in / -us.

module "eks_eu" {
  providers = { aws = aws.eu }
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"
  cluster_name    = "talentbridge-eu-${var.environment}"
  cluster_version = var.eks_version
  vpc_id     = aws_vpc.eu.id
  subnet_ids = aws_subnet.eu_private[*].id
  cluster_endpoint_public_access = true
  enable_irsa                    = true
  eks_managed_node_groups = {
    default = { min_size = var.node_min, max_size = var.node_max, desired_size = var.node_min, instance_types = [var.node_instance], capacity_type = "ON_DEMAND" }
  }
  cluster_addons = {
    coredns = { most_recent = true }, kube-proxy = { most_recent = true },
    vpc-cni = { most_recent = true }, aws-ebs-csi-driver = { most_recent = true }
  }
}

module "eks_in" {
  providers = { aws = aws.in }
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"
  cluster_name    = "talentbridge-in-${var.environment}"
  cluster_version = var.eks_version
  vpc_id     = aws_vpc.in.id
  subnet_ids = aws_subnet.in_private[*].id
  cluster_endpoint_public_access = true
  enable_irsa                    = true
  eks_managed_node_groups = {
    default = { min_size = var.node_min, max_size = var.node_max, desired_size = var.node_min, instance_types = [var.node_instance], capacity_type = "ON_DEMAND" }
  }
  cluster_addons = {
    coredns = { most_recent = true }, kube-proxy = { most_recent = true },
    vpc-cni = { most_recent = true }, aws-ebs-csi-driver = { most_recent = true }
  }
}

module "eks_us" {
  providers = { aws = aws.us }
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"
  cluster_name    = "talentbridge-us-${var.environment}"
  cluster_version = var.eks_version
  vpc_id     = aws_vpc.us.id
  subnet_ids = aws_subnet.us_private[*].id
  cluster_endpoint_public_access = true
  enable_irsa                    = true
  eks_managed_node_groups = {
    default = { min_size = var.node_min, max_size = var.node_max, desired_size = var.node_min, instance_types = [var.node_instance], capacity_type = "ON_DEMAND" }
  }
  cluster_addons = {
    coredns = { most_recent = true }, kube-proxy = { most_recent = true },
    vpc-cni = { most_recent = true }, aws-ebs-csi-driver = { most_recent = true }
  }
}
