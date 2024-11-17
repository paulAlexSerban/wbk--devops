resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
