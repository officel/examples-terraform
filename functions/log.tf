variable "log_v" {
  type    = number
  default = 50
}

variable "log_base" {
  description = "base number"
  type        = number
  default     = 10
}

variable "log_free" {
  default = [
    [15, 2],
    [16, 2],
    [17, 2],
  ]
}

output "log" {
  value = format("%v -> %v", var.log_v, log(var.log_v, var.log_base))
}

output "log_free" {
  value = [for v in var.log_free : format("%v -> %v", v.0, log(v.0, v.1))]
}

/* note

log() は指定された基数の指定された数値の対数を返す。

マイナスの値を与えるとエラー。
基数を１にするとエラー。

*/

