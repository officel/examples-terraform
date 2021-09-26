# local-exec

local-exec の再実行で apply と destroy を繰り返しているってツイートを見たので。

確かに local-exec や remote-exec にはランダムプロバイダーにあるような keepers がないので、
（ exec はプロバイダではなくてプロビジョナーだし）通常は一回作成したら次は処理されないけど、
taint やその代替になった replace オプションを指定すれば全体を再作成しなくても再実行できる。


```
terraform apply -replace null_resource.example
```

