data "aws_arn" "this" {
  arn = data.aws_billing_service_account.this.arn
}

output "aws_arn_this_billing_service_account" {
  value = data.aws_arn.this
}
