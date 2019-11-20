provider "aws" {
  profile     = "${var.aws_profile}"
  region      = "${var.aws_region}"
  max_retries = "${var.aws_max_retries}"
}