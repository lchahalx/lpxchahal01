module "oidc" {
  source = "../../modules/iam/oidc"

  eks_oidc_issuer_url = module.eks.cluster_oidc_issuer_url
  common_tags         = local.common_tags
}