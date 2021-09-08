variable "pow_v" {
  type    = number
  default = 3
}

variable "pow_base" {
  description = "base number"
  type        = number
  default     = 2
}

variable "pow_free" {
  default = [
    [3, 2],
    [4, 0],
  ]
}

output "pow" {
  value = format("%v -> %v", var.pow_v, pow(var.pow_v, var.pow_base))
}

output "pow_free" {
  value = [for v in var.pow_free : format("%v -> %v", v.0, pow(v.0, v.1))]
}

/* note

pow() は指数計算。

*/

