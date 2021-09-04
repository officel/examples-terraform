# zatsudan

日本企業の約７割がチームのコミュニケーションに課題があると[考えているそうです](https://hr-souken.jp/research/2571/)(2021年) 。

リモートワークでのチームの雑談の仕方やテーマ選びに試行錯誤しているチームも多いことでしょう。

ちょっとぐぐっても雑談のテーマを決めるツールは多数あります。

というわけで、terraform でテーマ選びを実装してみました。

単なるジョークです。


```
# Terraform v0.15.2 and later
terraform apply -replace random_shuffle.selector -auto-approve

# earlier version
terraform taint random_shuffle.selector
```

## see

- https://www.terraform.io/docs/cli/commands/taint.html

