# 時間を管理

resource "time_rotating" "this" {
  # リソースをローテーションさせるための間隔
  rotation_minutes = 3
}

resource "time_static" "this" {
  # 引数なしで現在時刻
  # トリガーでローテーションの間隔で作り直し
  triggers = {
    rotating = time_rotating.this.rfc3339
  }
}

resource "time_sleep" "this" {
  # 作成時に delay する
  create_duration = "5s"

  triggers = {
    rotating = time_static.this.rfc3339
  }
}

resource "time_offset" "this" {
  offset_hours = 1

  depends_on = [
    time_sleep.this
  ]

  triggers = {
    rotating = time_static.this.rfc3339
  }
}

output "time_provider" {
  value = <<-EOT
    time_static:   ${format("%v is current datetime", time_static.this.rfc3339)}
    time_sleep:    ${format("%v is delay %v", time_sleep.this.id, time_sleep.this.create_duration)}
    time_rotating: ${format("%v is next rotating datetime", time_rotating.this.rotation_rfc3339)}
    time_offset:   ${format("%v is offset 1 hour + %v from current datetime", time_offset.this.rfc3339, time_sleep.this.create_duration)}

    TIMEZONE
    JST:           ${formatdate("YYYY-MM-DD'T'hh:mm:ss'+0900 is current datetime JST'", timeadd(time_static.this.rfc3339, "9h"))}
    UTC:           ${formatdate("YYYY-MM-DD'T'hh:mm:ss'Z     is current datetime UTC'", timeadd(time_static.this.rfc3339, "0"))}
    PST:           ${formatdate("YYYY-MM-DD'T'hh:mm:ss'-0800 is current datetime PST'", timeadd(time_static.this.rfc3339, "-8h"))}
  EOT
}
