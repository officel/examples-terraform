variable "create" {
  description = "create if you need"
  type        = bool
  default     = false
}

variable "data" {
  description = "use data"
  type        = map(any)
  default     = {}
}


resource "random_shuffle" "this" {
  for_each = var.create ? var.data : {}

  input = each.value.input
  result_count = try(each.value.count.0,null)

  # as for keepers and seed, you do it
}

output "this" {
  value = random_shuffle.this
}
