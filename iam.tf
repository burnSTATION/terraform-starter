resource "aws_iam_group" "dms_users_group" {
  name = "dms_users"
  path = "/dms_users/"
}

resource "aws_iam_policy" "dms_users_policy" {
  name        = "dms_users_policy"
  description = "Allows users full access to AWS Database Migration Service"
  policy      = file("policydmsaccess.json")
}

resource "aws_iam_group_policy_attachment" "dms_users_gpa" {
  group = aws_iam_group.dms_users_group.name
  policy_arn = aws_iam_policy.dms_users_policy.arn
}
