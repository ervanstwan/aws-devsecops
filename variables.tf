variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "ervan_ecs"
}

variable "task_family" {
  description = "ECS task family"
  type        = string
  default     = "ervan_task"
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
  default     = "my-codebuild-project"
}

variable "project_description" {
  description = "CodeBuild project description"
  type        = string
  default     = "Terraform managed CodeBuild project"
}

variable "source_location" {
  description = "Source repo URL"
  type        = string
  default     = "https://github.com/ervanstwan/aws-devsecops"
}

variable "source_type" {
  description = "Source provider type"
  type        = string
  default     = "GITHUB"
}

variable "buildspec" {
  description = "Buildspec content or path"
  type        = string
  default     = ""
}

variable "privileged_mode" {
  description = "Enable privileged mode"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Environment variables map for CodeBuild"
  type        = map(string)
  default     = {}
}

variable "service_role_arn" {
  description = "CodeBuild service role ARN"
  type        = string
}

variable "task_cpu" {
  description = "CPU units for task"
  type        = string
  default     = "1024"
}

variable "task_memory" {
  description = "Memory (MB) for task"
  type        = string
  default     = "3072"
}

variable "task_role_arn" {
  description = "IAM role ARN for task"
  type        = string
  default     = "arn:aws:iam::512742310782:role/ecsTaskExecutionRole"
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "ervan_nginx"
}

variable "container_image" {
  description = "Container image URI"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "container_environment" {
  description = "Container environment variables"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
  default     = "/ecs/my-log-group"
}

variable "log_stream_prefix" {
  description = "CloudWatch log stream prefix"
  type        = string
  default     = "ecs"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "Allowed ingress CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "assign_public_ip" {
  description = "Assign public IP"
  type        = bool
  default     = true
}

variable "desired_count" {
  description = "ECS desired task count"
  type        = number
  default     = 1
}

variable "deployment_minimum_healthy_percent" {
  description = "Minimum healthy percent"
  type        = number
  default     = 50
}

variable "deployment_maximum_percent" {
  description = "Maximum deployment percent"
  type        = number
  default     = 200
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

variable "name_prefix" {
  description = "Prefix for ALB"
  type        = string
  default     = "myapp"
}

variable "enable_https" {
  description = "Enable HTTPS on ALB"
  type        = bool
  default     = false
}

variable "acm_certificate_arn" {
  description = "ACM Certificate ARN"
  type        = string
  default     = ""
}

variable "codepipeline_project_name" {
  description = "CodePipeline project name"
  type        = string
  default     = "my-codepipeline-project"
}

variable "s3_bucket" {
  description = "S3 bucket for pipeline"
  type        = string
  default     = ""
}

variable "source_provider" {
  description = "Source provider"
  type        = string
  default     = "GitHub"
}

variable "source_branch" {
  description = "Source branch"
  type        = string
  default     = "main"
}

variable "source_owner" {
  description = "Repository owner"
  type        = string
  default     = ""
}

variable "source_repo" {
  description = "Repository name"
  type        = string
  default     = ""
}

variable "oauth_token" {
  description = "OAuth token for GitHub"
  type        = string
  default     = ""
}
