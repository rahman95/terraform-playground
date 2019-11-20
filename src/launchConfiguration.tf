resource "aws_launch_configuration" "tf-launch-config" {
  # Use this find correct EC2 image https://cloud-images.ubuntu.com/locator/ec2/
  image_id        = "ami-00622b440d92e55c0"                          # 18.04 LTS image
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.tf-secGroup-example.id}"] # A reference to our secGroup we have set up

  # AWS will execute when the instance is booting
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  # The default order is to delete the old resource and then create the new one. 
  # Setting create_before_destroy to true reverses this order, creating the replacement first, and then deleting the old one.
  lifecycle {
    create_before_destroy = true
  }
}
