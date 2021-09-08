variable "signum_v" {
  type    = number
  default = -123
}

variable "signum_free" {
  default = [
    -20,
    0,
    2,
  ]
}

output "signum" {
  value = format("%v -> %v", var.signum_v, signum(var.signum_v))
}

output "signum_free" {
  value = [for v in var.signum_free : format("%v -> %v", v, signum(v))]
}

/* note

signum() は数値の符号を決める値を返す。

*/
