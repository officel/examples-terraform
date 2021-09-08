variable "min_v" {
  type    = list(number)
  default = [-10, -1, 0, 1, 10, 12]
}

variable "min_free" {
  default = [-1.1, -1, 0, 1]
}

output "min" {
  value = format("%v -> %v", var.min_v, min(var.min_v...))
}

output "min_free" {
  value = format("%v -> %v", var.min_free, min(var.min_free...))
}

/* note

min() は最小値を返す。

*/

