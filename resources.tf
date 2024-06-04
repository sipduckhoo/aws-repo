# Create an user
resource "aws_iam_user" "adam" {
  name = "adam.god"
}

# Create a group
resource "aws_iam_group" "devops" {
  name="devops"
}

# Get a policy from existing one.
data "aws_iam_policy" "Administrator_Access" {
  name="AdministratorAccess"
}

# attach policy to group
resource "aws_iam_group_policy_attachment" "attach" {
  group=aws_iam_group.devops.name
  policy_arn = data.aws_iam_policy.Administrator_Access.arn
}

resource "aws_iam_user" "eve" {
  name = "eve"

  tags = {
    Name = "Eve"
  }
}

resource "aws_iam_group_membership" "devops" {
    name = aws_iam_group.devops.name 

    users = [
        aws_iam_user.eve.name
    ]
    group = aws_iam_group.devops.name #타겟 그룹
}

resource "aws_s3_bucket" "bucket2"{
    bucket = var.inst-type
}

resource "aws_instance" "web-1"{
    ami = var.ami
    instance_type = var.inst-type
}

resource "aws_instance" "web-2"{
    ami = var.ami
    instance_type = var.inst-type
    key_name = aws_key_pair.mykey.key_name
}
#이때 이 인스턴스는 default VPC에 생성된다.

resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}