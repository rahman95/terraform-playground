resource "aws_autoscaling_group" "tf-asg" {
  launch_configuration = "${aws_launch_configuration.tf-launch-config.id}"
  availability_zones   = ["${data.aws_availability_zones.available.names}"]

  # will run between 2 and 10 EC2 Instances
  min_size = 2
  max_size = 10

  # Use our defined load balancer
  load_balancers = ["${aws_elb.tf-elb.name}"]

  # The default health_check_type is "EC2", which is a minimal health check that only a considers Instance unhealthy if the AWS hypervisor says.
  # The "ELB" health check is much more robust, as it tells the ASG to use the CLB’s health check
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "tf-asg"
    propagate_at_launch = true
  }
}
