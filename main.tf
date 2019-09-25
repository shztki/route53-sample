terraform {
  required_version = "~> 0.12"
}

module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace   = "${lookup(var.label, "namespace")}"
  stage       = "${lookup(var.label, "stage")}"
  name        = "${lookup(var.label, "name")}"
  attributes  = ["${lookup(var.label, "namespace")}", "${lookup(var.label, "stage")}", "${lookup(var.label, "name")}"]
  delimiter   = "-"
  label_order = ["namespace", "stage", "name"]
}

