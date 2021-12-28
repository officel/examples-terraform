# data "aws_ec2_instance_type_offerings" "this" {
# 使ってないようなインスタンスタイプも出てきちゃうのでむしろ邪魔だった
# 変数で受け渡しして offering は使わないようにした
# }

# @todo リージョン対応

data "aws_ec2_instance_types" "this" {
  # 変数で渡されたインスタンスタイプのリストを元に有効なインスタンスタイプをリストしなおす
  filter {
    name   = "instance-type"
    values = var.instance_types
  }
}

data "aws_instances" "this" {
  # 有効なインスタンスタイプを元に稼働中のインスタンスをリスト
  # @todo 検索条件を追加（ステータスとか）
  filter {
    name   = "instance-type"
    values = data.aws_ec2_instance_types.this.instance_types
  }
}

data "aws_instance" "this" {
  # リストされたインスタンスの情報を収集
  for_each    = zipmap(data.aws_instances.this.ids, data.aws_instances.this.private_ips)
  instance_id = each.key
}

