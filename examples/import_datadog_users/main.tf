locals {
  emails = [
    { email = "user_a@example.com" },
    { email = "user_b@example.com" },
    { email = "user_c@example.com" },
  ]

  importer = [for i in local.emails : format("terraform import datadog_user.user['%s'] %s", i.email, data.datadog_user.user[i.email].id)]
}

data "datadog_user" "user" {
  for_each = { for i in local.emails : i.email => i }
  filter   = each.value.email
}

output "users" {
  value = local.importer
}

