data "aws_billing_service_account" "this" {}

output "aws_billing_service_account" {
  value = data.aws_billing_service_account.this.arn
}


