# 時間を計算

variable "rfc3339" {
  type    = string
  default = ""

  validation {
    condition     = var.rfc3339 == "" || can(formatdate("", var.rfc3339))
    error_message = "The rfc3339 argument requires a valid RFC 3339 format string '2021-11-20T12:24:59Z' is valid."
  }
}

resource "time_static" "calc" {
  # rfc3339 = can(formatdate("", var.rfc3339)) ? var.rfc3339 : time_static.this.rfc3339
  rfc3339 = var.rfc3339 != "" ? var.rfc3339 : time_static.this.rfc3339

  # トリガーでローテーションの間隔で作り直し
  triggers = {
    rotating = time_rotating.this.rfc3339
  }
}


locals {
  # 秒数
  m30 = 1800
  m10 = 600

  # 切り捨て
  floor_30min = format("-%vs", (time_static.calc.unix % local.m30))
  floor_10min = format("-%vs", (time_static.calc.unix % local.m10))

  # 丸め
  round_30min = format("%vs", (tobool(signum((time_static.calc.unix % local.m30) - (local.m30 / 2)) >= 0) ? local.m30 : 0) - (time_static.calc.unix % local.m30))
  round_10min = format("%vs", (tobool(signum((time_static.calc.unix % local.m10) - (local.m10 / 2)) >= 0) ? local.m10 : 0) - (time_static.calc.unix % local.m10))

  # 指定時間で割った余り(%)は指定時間単位で過ぎている時間秒数で、丸めるためにその半分から引く
  # 正の整数になる＝半分以上過ぎている、なら繰り上げるために指定時間分足して経過時間を引く
  # マイナスになる＝半分未満、なら経過時間だけ引く

  # 切り上げ
  ceil_30min = format("%vs", local.m30 - (time_static.calc.unix % local.m30))
  ceil_10min = format("%vs", local.m10 - (time_static.calc.unix % local.m10))
}

output "time_function" {
  value = <<-EOT
    CALCULATE
    current:       ${formatdate("YYYY-MM-DD'T'hh:mm:ssZ", timeadd(time_static.calc.rfc3339, "0"))}

    （この時間は過ぎた）
    floor hour:    ${formatdate("YYYY-MM-DD'T'hh:00:00Z", timeadd(time_static.calc.rfc3339, "0"))}
    floor 30 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.floor_30min))}
    floor 10 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.floor_10min))}

    （だいたいこの時間）
    round hour:    ${formatdate("YYYY-MM-DD'T'hh:00:00Z", timeadd(time_static.calc.rfc3339, "30m"))}
    round 30 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.round_30min))}
    round 10 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.round_10min))}

    （もうすぐこの時間）
    ceil  hour:    ${formatdate("YYYY-MM-DD'T'hh:00:00Z", timeadd(time_static.calc.rfc3339, "1h"))}
    ceil  30 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.ceil_30min))}
    ceil  10 min:  ${formatdate("YYYY-MM-DD'T'hh:mm:00Z", timeadd(time_static.calc.rfc3339, local.ceil_10min))}

  EOT
}
