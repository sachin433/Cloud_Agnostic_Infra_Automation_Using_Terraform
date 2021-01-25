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
  instance_list        = flatten(values(local.expanded_names))
  instance_size_list   = flatten(values(local.expanded_names_size))
  unique_instance_list = distinct(local.instance_size_list)
  subnetids            = [for s in data.aws_subnet.public : s.id]
  securitygroup        = "${data.aws_security_group.comviva_sg.id}"
  vpc_cidr             = data.aws_vpc.my_vpc.cidr_block
}
