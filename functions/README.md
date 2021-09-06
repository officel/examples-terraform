# Built-in Functions

https://www.terraform.io/docs/language/functions/index.html

# how to work

```
terraform init
terraform plan
terraform apply
terraform output [function name]
```

That's all.

# ex abs()

- see abs.tf
- `terraform output abs`
- `terraform output abs_free`
- no need abs_free ? create file abs.auto.tfvars. iside `abs_free = []`

