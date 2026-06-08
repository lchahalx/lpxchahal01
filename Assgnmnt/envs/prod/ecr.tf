module "ecr" {
  source = "../../modules/ecr"

  project     = local.project
  common_tags = local.common_tags
}