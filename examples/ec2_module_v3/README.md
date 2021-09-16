# terraform-aws-ec2-instance module upgrade from v2.x to v3.x

https://github.com/terraform-aws-modules/terraform-aws-ec2-instance

AWS EC2 を作成するモジュールのバージョンアップに伴って、これまでの書き方を
変更する必要がでてきた。

具体的な変更方法は https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/blob/master/UPGRADE-3.0.md
のとおりだが、例のように３つ程度はともかく、数十台を一斉に処理していた場合に、
丁寧に locals を書いていくのは面倒なので、なるべく既存の書き方を壊さないでいいように
locals 内でループで片付けられるようにした。

