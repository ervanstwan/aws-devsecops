provider "aws" {
  region  = var.region
  profile = "myprofile"
}

module "ecs" {
  source                             = "./ecs"
  cluster_name                       = var.cluster_name
  task_family                        = var.task_family
  task_cpu                           = var.task_cpu
  task_memory                        = var.task_memory
  task_role_arn                      = var.task_role_arn
  container_name                     = var.container_name
  container_image                    = var.container_image
  container_port                     = var.container_port
  container_environment              = var.container_environment
  log_group_name                     = var.log_group_name
  log_stream_prefix                  = var.log_stream_prefix
  region                             = var.region
  vpc_id                             = var.vpc_id
  subnets                            = var.subnets
  allowed_cidr_blocks                = var.allowed_cidr_blocks
  assign_public_ip                   = var.assign_public_ip
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  tags                               = var.tags
}

module "alb" {
  source              = "./alb"
  name_prefix         = var.name_prefix
  vpc_id              = var.vpc_id
  subnets             = var.subnets
  allowed_cidr_blocks = var.allowed_cidr_blocks
  enable_https        = var.enable_https
  acm_certificate_arn = var.acm_certificate_arn
  tags                = var.tags
}

module "codebuild" {
  source                = "./codebuild"
  project_name          = var.codebuild_project_name
  project_description   = var.project_description
  source_location       = var.source_location
  source_type           = var.source_type
  buildspec             = var.buildspec
  privileged_mode       = var.privileged_mode
  environment_variables = var.environment_variables
  tags                  = var.tags
  service_role_arn      = aws_iam_role.codebuild_role.arn
}

module "codepipeline" {
  source                     = "./codepipeline"
  project_name               = var.codepipeline_project_name
  s3_bucket                  = var.s3_bucket
  source_provider            = var.source_provider
  source_branch              = var.source_branch
  source_owner               = var.source_owner
  source_repo                = var.source_repo
  oauth_token                = var.oauth_token
  codebuild_project_name     = module.codebuild.codebuild_project_name
  service_role_arn           = aws_iam_role.codebuild_role.arn
  codebuild_service_role_arn = aws_iam_role.codebuild_role.arn
}
