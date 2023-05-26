##VPC creation
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = merge(
    var.tags,
    { Name = "${var.env}-vpc" }
  )
}

##public subnets
resource "aws_subnet" "public_subnets" {
  vpc_id              = aws_vpc.main.id
  for_each            = var.public_subnets
  Cidr_block          = each.value["cidr_block"]
  availability_zone   = each.value["availability_zone"]
  tags       = merge(
    var.tags,
    { Name = "${var.env}-${each.value["name"]}" }
  )
}