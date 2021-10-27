locals {
  instance_count = 5
  subnets        = ["s0", "s1", "s2"]

  num_suffix_format = "-%02d"

  multiple_instances = {
    for i in range(0, local.instance_count) : i => {
      num_suffix    = i + 1
      instance_type = "t3.medium"
      subnet_id     = element(local.subnets, i)
    }
  }

}

output "result" {
  value = local.multiple_instances
}

output "result_length" {
  value = length(local.multiple_instances)
}

output "result_keys" {
  value = keys(local.multiple_instances)
}
