data "aws_iam_account_alias" "current" {}

output "account_id" {
  value = data.aws_iam_account_alias.current.id
}

output "account_alias" {
  value = data.aws_iam_account_alias.current.account_alias
}

# @note エイリアスを設定すると id もエイリアスになっちゃうの使い勝手悪い気がする

