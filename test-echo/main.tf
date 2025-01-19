resource "null_resource" "echo" {
  triggers = {
    echo = "hello atlantis"
  }
}

output v {
    value = null_resource.echo
}