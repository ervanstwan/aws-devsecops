variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "project_description" {
  description = "Description of the CodeBuild project"
  type        = string
  default     = "Terraform managed CodeBuild project"
}

variable "service_role_arn" {
  description = "IAM role ARN for CodeBuild service"
  type        = string
}

variable "source_type" {
  description = "Source type for CodeBuild project"
  type        = string
  default     = "GITHUB"
}

variable "source_location" {
  description = "Source location for CodeBuild project"
  type        = string
}

variable "buildspec" {
  description = "Buildspec file or content"
  type        = string
  default     = "buildspec.yml"
}

variable "compute_type" {
  description = "Compute type for CodeBuild environment"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  description = "Docker image for CodeBuild environment"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "privileged_mode" {
  description = "Enable privileged mode for Docker in CodeBuild"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Map of environment variables for CodeBuild"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags for the CodeBuild project"
  type        = map(string)
  default     = {}
}
