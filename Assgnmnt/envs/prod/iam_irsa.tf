module "irsa_alb_controller" {
  source = "../../modules/iam/irsa"

  project              = local.project
  role_name            = "alb-controller"
  oidc_provider_arn    = module.oidc.oidc_provider_arn
  oidc_provider_url    = module.oidc.oidc_provider_url
  namespace            = "kube-system"
  service_account_name = "aws-load-balancer-controller"
  policy_document      = file("${path.module}/policies/alb_controller.json")
  common_tags          = local.common_tags
}

module "irsa_cluster_autoscaler" {
  source = "../../modules/iam/irsa"

  project              = local.project
  role_name            = "cluster-autoscaler"
  oidc_provider_arn    = module.oidc.oidc_provider_arn
  oidc_provider_url    = module.oidc.oidc_provider_url
  namespace            = "kube-system"
  service_account_name = "cluster-autoscaler"
  policy_document      = file("${path.module}/policies/cluster_autoscaler.json")
  common_tags          = local.common_tags
}

module "irsa_external_secrets" {
  source = "../../modules/iam/irsa"

  project              = local.project
  role_name            = "external-secrets"
  oidc_provider_arn    = module.oidc.oidc_provider_arn
  oidc_provider_url    = module.oidc.oidc_provider_url
  namespace            = "external-secrets"
  service_account_name = "external-secrets"
  policy_document      = file("${path.module}/policies/external_secrets.json")
  common_tags          = local.common_tags
}