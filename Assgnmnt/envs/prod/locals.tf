locals {
  project = "app_assignment"
  region  = "us-east-1"
  profile = "lchahal"

  # VPC
  vpc_cidr             = "10.0.0.0/20"
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs  = ["10.0.1.0/26", "10.0.2.0/26"]
  private_subnet_cidrs = ["10.0.3.0/25", "10.0.4.0/25"]

  # EKS
  cluster_version          = "1.34"
  instance_types           = ["t3.medium"]
  capacity_type            = "SPOT"
  min_size                 = 1
  max_size                 = 2
  desired_size             = 1
  addon_vpc_cni_version    = "v1.21.2-eksbuild.2"
  addon_coredns_version    = "v1.13.2-eksbuild.7"
  addon_kube_proxy_version = "v1.34.6-eksbuild.8"

  # RDS
  db_name           = "pulsecheck"
  db_username       = "lpxchahal"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  # Tags
  common_tags = {
    Project     = local.project
    ManagedBy   = "terraform"
    Environment = "prod"
  }
}