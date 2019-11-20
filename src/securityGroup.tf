resource "aws_security_group" "tf-secGroup-example" {
  name = "tf-secGroup-example"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # CIDR scheme: https://www.ipaddressguide.com/cidr
  }
}

resource "aws_security_group" "tf-secGroup-elb-example" {
  name = "tf-secGroup-elb-example"

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
