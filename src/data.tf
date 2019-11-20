# Will fetch data out of a data source for you to use
data "aws_availability_zones" "available" {
  state = "available"
}
