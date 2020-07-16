provider "aws" {
region = "us-east-1"
}

//To create a group

resource "aws_iam_group" "devops"{
name = "devops"
path = "/users/"

}

//To assign user to a group

resource "aws_iam_group_membership" "devops" {
  name = "devops"
  users = ["aws_iam_user.users.name"]  //need to be modified getting error
  group = "aws_iam_group.group.name"

}

//To assing a policy to a group

  data "aws_iam_policy" "s3policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess" //policy arn
}

//TO create users using for_each

resource "aws_iam_user" "users" {
    for_each = toset(var.iamuser)
    name = each.value

}
