module "eks" {
  source = "../../modules/eks"

  project             = local.project
  cluster_version     = local.cluster_version
  cluster_role_arn    = module.eks_roles.cluster_role_arn
  node_group_role_arn = module.eks_roles.node_group_role_arn
  private_subnet_ids  = module.vpc.private_subnet_ids

  instance_types = local.instance_types
  capacity_type  = local.capacity_type
  min_size       = local.min_size
  max_size       = local.max_size
  desired_size   = local.desired_size

  addon_vpc_cni_version    = local.addon_vpc_cni_version
  addon_coredns_version    = local.addon_coredns_version
  addon_kube_proxy_version = local.addon_kube_proxy_version

  common_tags = local.common_tags
}