resource "aws_route_table_association" "arta"{
   subnet_id = aws_subnet.main.id
   route_table_id = aws_route_table.r.id
}