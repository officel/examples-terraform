
module "test" {
  source = "./module/"

  create = true
  data = {
    "test1" = {
      "input" = ["1-1", "1-2", "1-3", "1-4"]
    }
    "test2" = {
      "input" = ["2-1", "2-2", "2-3", "2-4"],
      "count" = [2]
      # 使う側で同じ高さのキーは同じtypeじゃないとエラーになるので
      # リスト側を文字列にして使うときに分解するか、
      # この例のように type をそろえてあげる必要がある？
      # 絶対にできないわけではないけど要検証
    }
  }
}

output "test" {
  value = values(module.test.this)[*].result
}

