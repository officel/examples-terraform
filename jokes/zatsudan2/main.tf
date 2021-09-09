variable "csv_file" {
  description = "csv file name"
  type        = string
  default     = "zatsudan2.csv"

  validation {
    # condition では path.module variable が使えないので、実務で使うには怪しい
    condition     = fileexists(var.csv_file)
    error_message = "The file must exist."
  }
}

locals {
  # ファイル読み込みのイディオム
  # 読み込み時に path.module を指定すればディレクトリ移動系オプション付きで実行されても大丈夫
  read_file = chomp(file("${path.module}/${var.csv_file}"))

  # 先頭行をキーとして読み込む
  csv_data = csvdecode(local.read_file)
}

resource "random_integer" "selector" {
  min = 0
  max = length(local.csv_data) - 1

  # 配列の添え字は 0 始まりで、max から 1 引くのを忘れない
  # みたいなコメントを残しておくのは親切か余計なお世話か

  keepers = {
    # ファイルの中身をキャッシュして変更があったら自動更新する
    # これも実務では使いにくい（勝手に更新されても困る）
    # 実務では var.csv_file を使うといい
    csv_data = local.read_file
  }
}

output "selected" {
  value = local.csv_data[random_integer.selector.result]
}

