variable "parseint_v" {
  type    = string
  default = "1010"
}

variable "parseint_base" {
  description = "base number"
  type        = number
  default     = 2
}

variable "parseint_free" {
  default = [
    ["100", 10],
    ["FF", 16],
    ["-10", 16],
    ["1011111011101111", 2],
    ["aA", 62],
  ]
}

output "parseint" {
  value = format("%v -> %v", var.parseint_v, parseint(var.parseint_v, var.parseint_base))
}

output "parseint_free" {
  value = [for v in var.parseint_free : format("%v -> %v", v.0, parseint(v.0, v.1))]
}

/* note

parseint() は基数表現。

*/

