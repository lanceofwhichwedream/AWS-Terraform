resource "aws_vpc" "cool_network" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
}

resource "aws_security_group" "security_network" {
  name        = "network_rules"
  description = "Default Network Rules to protect the applications"
  vpc_id      = aws_vpc.cool_network.id

  tags = {
    Name = "network_rules"
  }
}

# IPv4 Rules
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv4         = aws_vpc.cool_network.cidr_block
  from_port         = 80
  ip_protocol       = tcp
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv4         = aws_vpc.cool_network.cidr_block
  from_port         = 443
  ip_protocol       = tcp
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv4         = aws_vpc.cool_network.cidr_block
  from_port         = 22
  ip_protocol       = tcp
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv4         = aws_vpc.cool_network.cidr_block
  from_port         = 80
  ip_protocol       = tcp
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv4         = aws_vpc.cool_network.cidr_block
  from_port         = 443
  ip_protocol       = tcp
  to_port           = 443
}

# IPv6 Rules
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv6" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv6         = aws_vpc.cool_network.ipv6_cidr_block
  from_port         = 80
  ip_protocol       = tcp
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv6" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv6         = aws_vpc.cool_network.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = tcp
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv6" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv6         = aws_vpc.cool_network.ipv6_cidr_block
  from_port         = 22
  ip_protocol       = tcp
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_http_ipv6" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv6         = aws_vpc.cool_network.ipv6_cidr_block
  from_port         = 80
  ip_protocol       = tcp
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv6" {
  security_group_id = aws_security_group.security_network.id
  cidr_ipv6         = aws_vpc.cool_network.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = tcp
  to_port           = 443
}