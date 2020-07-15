resource "aws_instance" "bastion" {
  ami = "ami-07a8c73a650069cf3"
  instance_type = "t2.micro"
  key_name = "key1"
  vpc_security_group_ids = [ "${aws_security_group.bastion_sg.id}" ]
  subnet_id = aws_subnet.main.id  
tags ={
    Name = "bastion"
  }
  
}