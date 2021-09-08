variable "formatdate_v" {
  type    = string
  default = "2021-01-02T03:04:05Z"
}

variable "formatdate_free" {
  default = [
    # RFC 850
    ["EEEE, DD-MMM-YY hh:mm:ss ZZZ", "2021-01-02T03:04:05Z"],

    # RFC 1123
    ["EEE, DD MMM YYYY hh:mm:ss ZZZ", "2021-01-02T03:04:05Z"],

    # RFC 3339
    ["YYYY-MM-DD'T'hh:mm:ssZ", "2021-01-02T03:04:05Z"],
  ]
}

output "formatdate" {
  # RFC 822 and RFC RFC 2822
  value = format("%v -> %v", var.formatdate_v, formatdate("DD MMM YYYY hh:mm ZZZ", var.formatdate_v))
}

output "formatdate_free" {
  value = [for v in var.formatdate_free : format("%v -> %v", v.1, formatdate(v.0, v.1))]
}

/* note

formatdate() は文字列を日付フォーマットで変換する。

*/

