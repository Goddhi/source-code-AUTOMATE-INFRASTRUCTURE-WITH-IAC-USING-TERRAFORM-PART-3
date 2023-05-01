# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terradorm-state-bucket1"

#   # Enable versioning so we can see the full revision history of our state files
#   versioning {
#     enabled = true
#   }
#   # Enable server-side encryption by default
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# # }

# #   resource "aws_dynamodb_table" "terraform_locks" {
# #   name         = "terraform-locks"
# #   billing_mode = "PAY_PER_REQUEST"
# #   hash_key     = "LockID"
# #   attribute {
# #     name = "LockID"
# #     type = "S"
# #   }

# #   tags = merge(
# #     var.tags,
# #     {
# #       Name = format("%s-DynamoDB-Terraform-State-Lock-Table-%s", var.name, var.environment)
# #     },
# #   )
# # }


# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "terradorm-state-bucket1"
#   # Enable versioning so we can see the full revision history of our state files
#   versioning {
#     enabled = true
#   }
#   # Enable server-side encryption by default
#   force_destroy = true
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = merge(
#     var.tags,
#     {
#       Name = format("%s-Terraform-State-Store-%s", var.name, var.environment)
#     },
#   )
# }

# data "aws_s3_bucket" "terraform_state" {
#   bucket = "manny-dev-terraform-bucket"
# }

terraform {
  backend "s3" {
    bucket         = "terradorm-state-bucket1"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
