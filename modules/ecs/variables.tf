variable "name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "VPC ID from the vpc module"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs (load balancer, and tasks when assign_public_ip is true)"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs (tasks when assign_public_ip is false, needs a NAT gateway)"
  type        = list(string)
}

variable "container_image" {
  description = "Container image to run"
  type        = string
  default     = "public.ecr.aws/nginx/nginx:stable"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 2
}

variable "cpu" {
  description = "Fargate CPU units"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Fargate memory in MiB"
  type        = number
  default     = 512
}

variable "assign_public_ip" {
  description = "Give tasks a public IP (lets them pull images without a NAT gateway)"
  type        = bool
  default     = true
}
