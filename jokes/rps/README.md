# rps

Rock Paper Scissors. じゃんけんのことね。

```
terraform init
terraform plan
terraform apply
```

自動で手軽に

```
terraform apply -auto-approve -var="you=0"
```

学び

- バリデーションに contains() を使う
- random_integer の keeper に timestamp() を使うことで常に更新させる
- プログラム的な if 文は書きにくいので、 lookup() を使用したがこのあたりが限界
- template_file データソースでヒアドキュメントを使用して output を整形した

