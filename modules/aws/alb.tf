# resource "aws_lb_target_group" "javahome" {
#   # name     = "${var.env_name}-lb-tg"
#   for_each = var.listeners
#   # name     = "${each.key}-${var.env_name}"
#   port     = each.value
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id
#   tags = {
#     Env  = "${terraform.workspace}"
#     Name = "${each.key}-${var.env_name}"
#   }
# }

# resource "aws_lb_target_group_attachment" "javahome" {
#   //Need to repeat this resource equal to number of attaching instances
#   for_each = var.listeners
#   target_group_arn = aws_lb_target_group.javahome.arn
#   target_id        = "${aws_instance.web.*.id[count.index]}"
#   port             = 80
# }

# resource "aws_lb" "javahome" {
#   name               = "${var.env_name}-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = "${var.securitygroup}"
#   subnets            = var.subnet_ids
#
#   tags = {
#     Env  = "${terraform.workspace}"
#     Name = "${var.env_name}-lb-tf"
#   }
# }

# resource "aws_lb_listener" "web_tg" {
#   for_each          = var.listeners
#   load_balancer_arn = aws_lb.javahome.arn
#   port              = each.value
#   protocol          = "HTTP"
#
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.javahome.arn
#   }
# }
