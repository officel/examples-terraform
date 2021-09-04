locals {
  selection = [
    "た:旅",
    "の:乗り物",
    "し:仕事、趣味",
    "く:国(故郷）",
    "は:はやり",
    "な:長生き、健康",
    "す:スポーツ",
    "こ:子供",
    "つ:通信（ニュース・社会問題等）",
  ]
}

resource "random_shuffle" "selector" {
  input        = local.selection
  result_count = 1
}

output "selected" {
  value = random_shuffle.selector.result[0]
}

