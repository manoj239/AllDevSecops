locals {
  public_subnet_cidrs  = distinct(var.public_subnet_cidrs)
  private_subnet_cidrs = distinct(var.private_subnet_cidrs)
}

resource "aws_subnet" "public-subnets" {
  #count             = length(var.public_subnet_cidrs)
  count  = length(local.public_subnet_cidrs)
  vpc_id = aws_vpc.default.id
  map_public_ip_on_launch = true # ensures EC2 in this subnet gets a public IP
  cidr_block        = element(local.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(local.private_subnet_cidrs)
  vpc_id            = aws_vpc.default.id
  map_public_ip_on_launch = true # ensures EC2 in this subnet gets a public IP
  cidr_block        = element(local.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}