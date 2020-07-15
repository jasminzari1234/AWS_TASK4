resource "aws_eip" "nat" {
  vpc=true
  depends_on = [
    aws_internet_gateway.gw
]
  
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.main.id}"
  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "gw_NAT"
  }
}
resource "aws_route_table" "forprivate" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

 

  tags = {
    Name = "fordatabase"
  }
}
resource "aws_route_table_association" "nat" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.forprivate.id
  depends_on = [ aws_route_table.forprivate]
}