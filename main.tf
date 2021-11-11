terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "classuser" {
  name = "user"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_user_login_profile" "userprof" {
  user    = aws_iam_user.classuser.name
  pgp_key = ""
}

output "password" {
  value = aws_iam_user_login_profile.userprof.encrypted_password
}