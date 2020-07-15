resource "aws_subnet" "main1" {
  vpc_id      = aws_vpc.main.id
  cidr_block = "10.0.0.1/24"
  availability_zone = "ap-south-1b"
  

  tags = {
    Name = "subnet2"
  }
}
