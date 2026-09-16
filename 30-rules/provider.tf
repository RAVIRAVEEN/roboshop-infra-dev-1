
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
    backend "s3" {
        bucket         = "raveen-remote-state"
        key            = "roboshop-sg-rules"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile = true # Enables native S3 state locking
    }


}

provider "aws" {
  # Configuration options
  region = "us-east-1"

}

