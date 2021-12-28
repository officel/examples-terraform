output "report" {
  description = "terraform output -raw report > report.txt"
  value       = templatefile("${path.module}/report.tftpl", { instances = data.aws_instance.this })
}

