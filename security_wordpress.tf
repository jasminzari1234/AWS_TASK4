resource "aws_security_group" "WP_sg"{
name = "WP_sg"
description="allow ssh and http traffic"
vpc_id      = aws_vpc.main.id


ingress{
from_port =80 
to_port =80
protocol ="tcp"
cidr_blocks =["0.0.0.0/0"]
}

egress{
from_port =0
to_port = 0
protocol ="-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags={
   Name= "HTTP_SSH_wordpress"
}
}
