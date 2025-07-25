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
  description = "ARN of the IAM role that tasks assume"
  type        = string
  default     = null
}

variable "container_name" {
  default = "ervan_container"
}

variable "container_image" {
  default = "nginx:latest"
}

variable "container_port" {
  default = 80
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "tags" {
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

variable "assign_public_ip" {
  default = true
}

variable "deployment_minimum_healthy_percent" {
  default = 100
}

variable "deployment_maximum_percent" {
  default = 200
}

variable "log_stream_prefix" {
  default = "ecs"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "container_environment" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name for ECS logs"
  default     = "/ecs/ervan-logs"  
}