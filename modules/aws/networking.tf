data "aws_vpc" "my_vpc" {
  id = var.vpc_id
}
data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.subnet_tag
  }
}

data "aws_subnet" "public" {
  for_each = data.aws_subnet_ids.public.ids
  id       = each.value
}
# variable "security_group_id" {}

data "aws_security_group" "comviva_sg" {
  # id = var.security_group_id
  tags = {
    Name = var.sg_tag
  }
}
