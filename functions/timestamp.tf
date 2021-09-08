output "timestamp" {
  value = "UTC Timestamp is here timestamp()."
}

/* note

timestamp() は UTC タイムスタンプ文字列を返す。
フォーマットは RFC 3339 で formattime() の引数に使用できる。
ただし毎秒変化するため使いどころに注意（ドキュメント参照）

time provider を使うほうが便利。
https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/static

*/

