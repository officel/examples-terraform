data "aws_region" "this" {}

output "aws_region_this" {
  value = data.aws_region.this
}



# 通常考える使えるリージョン
data "aws_regions" "this" {}

output "aws_regions_1_no_arg" {
  value = join(",", data.aws_regions.this.names)
}


# オプトインしていないので使えないリージョンが含まれる
data "aws_regions" "all" {
  all_regions = true
}

output "aws_regions_2_all" {
  value = join(",", data.aws_regions.all.names)
}


# オプトインしていないリージョンのリスト（ドキュメントの例のまま）
data "aws_regions" "all_not_optin" {
  all_regions = true

  filter {
    name   = "opt-in-status"
    values = ["not-opted-in"]
  }
}

output "aws_regions_3_all_not_optin" {
  value = join(",", data.aws_regions.all_not_optin.names)
}


# this と all の差分が not_optin と同じことを確認
output "aws_regions_4_assert" {
  value = join(",", setunion(setsubtract(data.aws_regions.this.names, data.aws_regions.all.names), setsubtract(data.aws_regions.all.names, data.aws_regions.this.names)))
}


# regions から region のリストを作る（おまけ）
data "aws_region" "all" {
  for_each = data.aws_regions.all.names
  name     = each.value
}

output "regions_info" {
  value = data.aws_region.all
}

