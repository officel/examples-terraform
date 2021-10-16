# current region の az のリスト
data "aws_availability_zones" "this" {
  state = "available"
}

# 最初の１つの詳細
data "aws_availability_zone" "this" {
  name = data.aws_availability_zones.this.names[0]
}

output "aws_availability_zone_this" {
  value = data.aws_availability_zone.this
}

