#these are for public
resource "aws_subnet" "public-ap-northeast-2a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-2a"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "public-ap-northeast-2b" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.2.0/24"
  availability_zone       = "ap-northeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-2b"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "public-ap-northeast-2c" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.3.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-2c"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "public-ap-northeast-2d" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.4.0/24"
  availability_zone       = "ap-northeast-2d"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-2d"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

#these are for private
resource "aws_subnet" "private-ap-northeast-2a" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.11.0/24"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name    = "private-ap-northeast-2a"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "private-ap-northeast-2b" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.12.0/24"
  availability_zone       = "ap-northeast-2b"

  tags = {
    Name    = "private-ap-northeast-2b"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "private-ap-northeast-2c" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.13.0/24"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name    = "private-ap-northeast-2c"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

resource "aws_subnet" "private-ap-northeast-2d" {
  vpc_id                  = aws_vpc.app1.id
  cidr_block              = "10.88.14.0/24"
  availability_zone       = "ap-northeast-2d"

  tags = {
    Name    = "private-ap-northeast-2d"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}



