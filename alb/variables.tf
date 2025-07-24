variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "target_group_port" {
  description = "Port for target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "HTTP"
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold count"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold count"
  type        = number
  default     = 2
}

variable "health_check_timeout" {
  description = "Timeout for health check (seconds)"
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "Interval for health check (seconds)"
  type        = number
  default     = 30
}

variable "health_check_matcher" {
  description = "HTTP code matcher for healthy"
  type        = string
  default     = "200-399"
}

variable "enable_https" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = false
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
  default     = ""
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "enable_deletion_protection" {
  description = "Enable ALB deletion protection"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
