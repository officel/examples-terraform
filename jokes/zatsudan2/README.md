# zatsudan2

雑談テーマセレクターとしてジョークその２。

- CSV ファイルから選択
- CSV ファイルの更新で選択も自動更新
- CSV ファイル読み込み後の処理例として


```
# Terraform v0.15.2 and later
terraform apply -replace random_integer.selector -auto-approve

# earlier version
terraform taint random_integer.selector
```

