resource "aws_route53_zone" "this" {
  name          = "${var.zone_name}"
  comment       = "${module.label.id}"
  force_destroy = "true"
  tags          = "${module.label.tags}"
}

resource "aws_route53_record" "this" {
  zone_id = "${aws_route53_zone.this.zone_id}"
  name    = "${var.zone_name}"
  type    = "NS"
  ttl     = "300"

  records = [
    "${aws_route53_zone.this.name_servers.0}",
    "${aws_route53_zone.this.name_servers.1}",
    "${aws_route53_zone.this.name_servers.2}",
    "${aws_route53_zone.this.name_servers.3}",
  ]
}

## Get VPC
#data "aws_vpc" "this" {
#  filter {
#    name   = "tag:Name"
#    values = ["${var.vpc_name}"]
#  }
#}
#
#resource "aws_route53_zone" "this_local" {
#  vpc {
#    vpc_id = "${data.aws_vpc.this.id}"
#  }
#
#  name          = "${var.zone_name_local}"
#  comment       = "${module.label.id}"
#  force_destroy = "true"
#  tags          = "${module.label.tags}"
#}
#
#resource "aws_route53_record" "this_local" {
#  zone_id = "${aws_route53_zone.this_local.zone_id}"
#  name    = "${var.zone_name_local}"
#  type    = "NS"
#  ttl     = "300"
#
#  records = [
#    "${aws_route53_zone.this_local.name_servers.0}",
#    "${aws_route53_zone.this_local.name_servers.1}",
#    "${aws_route53_zone.this_local.name_servers.2}",
#    "${aws_route53_zone.this_local.name_servers.3}",
#  ]
#}
