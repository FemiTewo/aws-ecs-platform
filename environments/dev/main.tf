terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "femi-ecs-platform-tfstate-20261023"
    key          = "dev/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/vpc"
  name   = "ecs-platform-dev"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
