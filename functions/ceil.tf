variable "ceil_v" {
  type    = number
  default = -12.3
}

variable "ceil_free" {
  default = [
    -20.1,
    -1,
    0,
    1,
    1.4,
    1.5,
    2,
  ]
}

output "ceil" {
  value = format("%v -> %v", var.ceil_v, ceil(var.ceil_v))
}

output "ceil_free" {
  value = [for v in var.ceil_free : format("%v -> %v", v, ceil(v))]
}

/* note

ceil() は切り上げ。

*/

