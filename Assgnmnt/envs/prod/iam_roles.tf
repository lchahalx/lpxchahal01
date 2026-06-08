module "eks_roles" {
  source = "../../modules/iam/eks_roles"

  project     = local.project
  common_tags = local.common_tags
}