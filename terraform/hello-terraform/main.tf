# resource resource_type resource_name {
#   argument1 = value1
#
# }
# each resource type has its own set of arguments that it accepts

resource "local_file" "hello_terraform" {
  content  = "Hello, Terraform! I am updated ;)"
  filename = "${path.module}/hello.txt"
  file_permission = 0700
}
