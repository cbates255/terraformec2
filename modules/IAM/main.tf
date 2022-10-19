resource "aws_iam_policy" "ec2_list_buckets" {
  name        = "ec2_list_buckets"
  policy = jsonencode({
    "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "s3:ListBucket",
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_role" "ec2_project_role" {
  name = "ec2_project_role"
  managed_policy_arns = [aws_iam_policy.ec2_list_buckets.arn]
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ])
}