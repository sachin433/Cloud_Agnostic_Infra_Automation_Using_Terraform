locals {
  expanded_names = {
    for name, count in var.instance_counts : name => [
      for i in range(count) : format("%s%02d", name, i + 1)
    ]
  }
  expanded_names_size = {
    for name, count in var.instance_counts : name => [
      for i in range(count) : format("%s", name)
    ]
  }
  instance_list      = flatten(values(local.expanded_names))
  instance_size_list = flatten(values(local.expanded_names_size))
}
