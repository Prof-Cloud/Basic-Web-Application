resource "aws_security_group" "BasicApp-SG" {
  name        = "BasicApp-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
}

#Inbound Rules
resource "aws_vpc_security_group_ingress_rule" "BasicApp-SG_ipv4" {
  security_group_id = aws_security_group.BasicApp-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

#Outbound Rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.BasicApp-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
