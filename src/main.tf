resource "aws_instance" "tf-ec2-example" {
  # Use this find correct EC2 image https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-00622b440d92e55c0" # 18.04 LTS image
  instance_type = "t2.micro"

  tags = {
    Name = "tf-ec2-example"
  }
}
