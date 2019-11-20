resource "aws_instance" "tf-ec2-example" {
  # Use this find correct EC2 image https://cloud-images.ubuntu.com/locator/ec2/
  ami                    = "ami-00622b440d92e55c0"                          # 18.04 LTS image
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.tf-secGroup-example.id}"] # A reference to our secGroup we have set up

  # AWS will execute when the instance is booting
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "tf-ec2-example"
  }
}

output "public_ip" {
  value       = "${aws_instance.tf-ec2-example.public_ip}"
  description = "The public IP of the web server"
}
