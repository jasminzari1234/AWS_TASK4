resource "aws_security_group" "bastion_sql_sg"{
name = "bastion_sql_sg"
description="allow ssh and http traffic"
vpc_id      = aws_vpc.main.id


ingress{
from_port =22
to_port =22
protocol ="tcp"
security_groups = [aws_security_group.bastion_sg.id]
}

egress{
from_port =0
to_port = 0
protocol ="-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags={
   Name= "HTTP_SSH_bastion"
}
}
