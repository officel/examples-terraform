variable "max_v" {
  type    = list(number)
  default = [-10, -1, 0, 1, 10, 12]
}

variable "max_free" {
  default = [-1.1, -1, 0, 1]
}

output "max" {
  value = format("%v -> %v", var.max_v, max(var.max_v...))
}

output "max_free" {
  value = format("%v -> %v", var.max_free, max(var.max_free...))
}

/* note

max() は最大値を返す。

*/

