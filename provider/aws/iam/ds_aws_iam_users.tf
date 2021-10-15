data "aws_iam_users" "users" {}

output "user_names" {
  value = data.aws_iam_users.users.names
}
