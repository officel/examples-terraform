variable "selection" {
  description = "tWhat shall we talk about?"

  type    = list(string)
  default = [
    "favorite music ?",
    "favorite AWS service is ?",
    "dog or cat ?",
  ]

  validation {
    condition     = length(var.selection) > 2
    error_message = "It needs to be a random value, so make it more than one list."
  }

}

resource "random_shuffle" "selector" {
  input        = var.selection
  result_count = 1
}

output "selected" {
  value = random_shuffle.selector.result[0]
}

