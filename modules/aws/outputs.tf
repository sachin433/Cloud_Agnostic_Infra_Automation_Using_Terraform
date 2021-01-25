output "instance_list" {
  value = local.instance_list
}
output "instance_size_list" {
  value = local.instance_size_list
}

output "unique_instance_list" {
  value = local.unique_instance_list
}

# output "subnetids" {
#   value = local.subnetids
# }

# output "securitygroup" {
#   value = "${data.aws_security_group.comviva_sg.*.id}"
# }
output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.public : s.cidr_block]
}
