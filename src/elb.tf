resource "aws_elb" "tf-elb" {
  name               = "tf-elb"
  security_groups    = ["${aws_security_group.tf-secGroup-elb-example.id}"]
  availability_zones = ["${data.aws_availability_zones.available.names}"]

  # periodically check the health of your EC2 Instances.
  # If an instance is unhealthy, it will automatically stop routing traffic to it
  health_check {
    target              = "HTTP:8080/"
    interval            = 30           # will make a call at every 30 seconds interval to check if instance is healthy 
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  # This adds a listener for incoming HTTP requests.
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 8080
    instance_protocol = "http"
  }
}
