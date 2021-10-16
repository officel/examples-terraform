data "aws_ip_ranges" "ec2" {
  regions  = [data.aws_region.this.name]
  services = ["ec2"]
}

output "aws_ip_ranges_ec2_cidr_blocks" {
  value = data.aws_ip_ranges.ec2.cidr_blocks[0]
}
