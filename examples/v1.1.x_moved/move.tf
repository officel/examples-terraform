# コメントを外して plan とかしてみましょう
/*
moved {
  from = null_resource.test01
  to   = null_resource.test11
}
*/

# from が存在している場合はエラーが出る（state mv 同様に移動先のリソースがない扱い）
/*
moved {
  from = null_resource.test02
  to   = null_resource.test12
}
*/

# from が見つからない場合はスルー
moved {
  from = null_resource.test04
  to   = null_resource.test14
}
