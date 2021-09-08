variable "floor_v" {
  type    = number
  default = -12.3
}

variable "floor_free" {
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

output "floor" {
  value = format("%v -> %v", var.floor_v, floor(var.floor_v))
}

output "floor_free" {
  value = [for v in var.floor_free : format("%v -> %v", v, floor(v))]
}

/* note

floor() は切り捨て。

*/

