module "rds" {
  source = "../../modules/rds"

  project               = local.project
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  eks_security_group_id = module.eks.node_security_group_id
  db_name               = local.db_name
  db_username           = local.db_username
  engine_version        = local.engine_version
  instance_class        = local.instance_class
  allocated_storage     = local.allocated_storage
  common_tags           = local.common_tags
}