resource "null_resource" "echo" {
  triggers = {
    echo = "hello atlantis"
  }
}