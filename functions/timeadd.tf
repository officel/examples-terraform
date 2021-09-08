variable "timeadd_v" {
  type    = string
  default = "2021-01-02T03:04:05Z"
}

variable "timeadd_free" {
  default = [
    ["2021-01-02T03:04:05Z", "1h"],
    ["2021-01-02T03:04:05Z", "-1h"],
    ["2021-01-02T03:04:05Z", "48h"],
  ]
}

output "timeadd" {
  value = format("%v -> %v", var.timeadd_v, timeadd(var.timeadd_v, "10m"))
}

output "timeadd_free" {
  value = [for v in var.timeadd_free : format("%v -> %v", v.1, timeadd(v.0, v.1))]
}

/* note

timeadd() は文字列で時間計算する。

*/

