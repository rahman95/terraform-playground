output "public_ip" {
  value       = "${aws_instance.tf-ec2-example.public_ip}"
  description = "The public IP of the web server"
}

output "clb_dns_name" {
  value       = "${aws_elb.tf-elb.dns_name}"
  description = "The domain name of the load balancer"
}
