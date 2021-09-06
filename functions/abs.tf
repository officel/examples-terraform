variable "abs_v" {
  type    = number
  default = -123
}

variable "abs_free" {
  default = [
    -20,
    -1,
    0,
    1,
    1.4,
    1.5,
    2,
  ]
}

output "abs" {
  value = format("%v -> %v", var.abs_v, abs(var.abs_v))
}

output "abs_free" {
  value = [for v in var.abs_free : format("%v -> %v", v, abs(v))]
}

/* note

abs() は絶対値を返します。
計算結果をマイナスとして扱わないことを明示できます（format()に渡す場合は %d で十分ですが）

*/
