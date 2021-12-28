# aws ec2 report example

ec2 インスタンスの情報をリストアップしてレポートを作成するひな形。
モジュールとして扱ってリージョン別、インスタンスタイプ別など自由に組み合わせできる。
インスタンスの一覧等を作成する時に便利。

```
terraform output -raw report > report.txt
```

