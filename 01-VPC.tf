# This makes vpc.id which is aws_vpc.app1.id for Seoul region
resource "aws_vpc" "app1" {
  cidr_block = "10.88.0.0/16"

  tags = {
    Name    = "app1"
    Service = "application1"
    Owner   = "Malgusclan"
    Planet  = "Dromundkaas"
  }
}

