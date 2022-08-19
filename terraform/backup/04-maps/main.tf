variable "users" {
  default = {
    ravs : { country : "Netherlands", department : "ABC" },
    tom : { country : "US", department : "DEF" },
    jane : { country : "India", department : "GHI" }
  }

}

provider "aws" {
  region = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

resource "aws_iam_user" "my_iam_users" {
  #count = length(var.names)
  #name  = var.names[count.index]
  for_each = var.users
  name     = each.key
  tags = {
    # country: each.value
    country : each.value.country
    department : each.value.department
  }
}