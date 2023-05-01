region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

tags = {
  Owner-Email     = "godwillcharles22@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}

name = "ACS"

environment = "dev"

destination_cidr_block = "0.0.0.0/0"

ami-nginx = "ami-004c3fbbd76269d17"

ami-web = "ami-0e1df35963a5cebfe"

ami-bastion = "ami-068286e7428ac0394"

ami-sonar = "ami-039445b0e88cf1cef"


keypair = "aws-key-pair"

# Ensure to change this to your acccount number
# account_no = "123456789"

master-username = "goddhi"

master-password = "devopspbl"

### -------- ALB -------- ###
ip_address_type     = "ipv4"
load_balancer_type  = "application"
port                = 80
protocol            = "HTTP"
company_name        = "ACS"
interval            = 10
path                = "/healthstatus"
timeout             = 5
healthy_threshold   = 5
unhealthy_threshold = 2
target_type         = "instance"
default_action_type = "forward"
priority            = 99