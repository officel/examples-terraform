variable "you" {
  description = "Your choice:(Rock:0, Paper:1, Scissors:2)"
  type        = number

  validation {
    condition     = contains(["0", "1", "2"], var.you)
    error_message = "Need value 0 or 1 or 2."
  }
}

resource "random_integer" "comp" {
  min = 0
  max = 2

  keepers = {
    # var.you をキーパーにすると連続して同じ手を出せない（更新されない）
    # timestamp() は常に差分が発生するので、都度更新する必要がある場合に使える
    # 目的外であることに注意（いつか使えなくなるかもしれない）
    always = timestamp()
  }
}

locals {
  hands = ["Rock", "Paper", "Scissors"]

  result = {
    "00" = "tied",
    "01" = "you loose",
    "02" = "you win!!",

    "10" = "you win!!",
    "11" = "tied",
    "12" = "you loose",

    "20" = "you loose",
    "21" = "you win!!",
    "22" = "tied",
  }
}

data "template_file" "result" {
  template = <<-EOT
  $${ result }

  You : $${ you } / Computer : $${ comp }
  EOT

  vars = {
    result = lookup(local.result, format("%d%d", var.you, random_integer.comp.result), "error?")
    you    = local.hands[var.you]
    comp   = local.hands[random_integer.comp.result]
  }
}

output "result" {
  value = data.template_file.result.rendered
}

