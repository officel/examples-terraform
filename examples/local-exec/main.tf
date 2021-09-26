resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "date > date.txt"
  }
}

