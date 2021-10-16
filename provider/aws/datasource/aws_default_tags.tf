data "aws_default_tags" "this" {}

output "default_tags" {
  value = data.aws_default_tags.this.tags
}

