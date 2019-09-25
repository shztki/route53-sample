output "public_zone_id" {
  value = "${aws_route53_zone.this.id}"
}

output "public_ns_servers" {
  value = "${aws_route53_zone.this.name_servers}"
}

#output "private_zone_id" {
#  value = "${aws_route53_zone.this_local.id}"
#}
#
#output "private_ns_servers" {
#  value = "${aws_route53_zone.this_local.name_servers}"
#}
