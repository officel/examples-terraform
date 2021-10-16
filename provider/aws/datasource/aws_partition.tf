data "aws_partition" "this" {}

output "aws_partition" {
  value = data.aws_partition.this
}
