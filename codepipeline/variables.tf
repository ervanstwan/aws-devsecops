variable "project_name" {
  description = "CodePipeline project name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "environment_variables" {
  type = map(string)
  default = {}
}

variable "buildspec" {
  description = "Buildspec file for CodeBuild project"
  type        = string
  default     = "buildspec.yml"
}

variable "privileged_mode" {
  description = "Enable privileged mode for CodeBuild"
  type        = bool
  default     = false
}

variable "image" {
  description = "Docker image for CodeBuild environment"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "source_type" {
  description = "Source type for CodeBuild project"
  type        = string
  default     = "GITHUB"
}

variable "source_location" {
  description = "Source location for CodeBuild project"
  type        = string
  default     = "https://github.com/ervanstwan/aws-devsecops"
}

variable "project_description" {
  description = "Description for the CodeBuild project"
  type        = string
  default     = "My CodeBuild project"
}

variable "compute_type" {
  description = "Compute type for CodeBuild project"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "s3_bucket" {
  description = "S3 bucket for artifact store"
  type        = string
}

variable "source_provider" {
  description = "Source code provider"
  type        = string
  default     = "GitHub"
}

variable "source_branch" {
  description = "Source code branch"
  type        = string
}

variable "source_owner" {
  description = "Repository owner"
  type        = string
}

variable "source_repo" {
  description = "Repository name"
  type        = string
}

variable "oauth_token" {
  description = "OAuth token for source repo access"
  type        = string
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
}

variable "service_role_arn" {
  description = "IAM Role ARN untuk CodeBuild"
  type        = string
}

variable "codebuild_service_role_arn" {
  type = string
}
