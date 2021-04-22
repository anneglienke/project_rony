# Users
locals {
  user_list = ["Anne_Glienke"]
  force_destroy = true
}

resource "aws_iam_user" "user" {
  for_each = toset(local.user_list)
  name     = each.value
}


# User Groups
resource "aws_iam_group" "admindatalake" {
  user_list = values(aws_iam_user.user)[*].name
  name = "Admin-Datalake"
  path = "/"
}