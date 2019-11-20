resource "aws_security_group" "tf-secGroup-example" {
  name = "tf-secGroup-example"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # CIDR scheme: https://www.ipaddressguide.com/cidr
  }
}
