resource "aws_iam_policy" "ec2_list_buckets" {
  name        = var.policy_name
  policy = jsonencode({
    "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                "s3:ListBucket",
                "s3:ListStorageLensConfigurations",
                "s3:ListAccessPointsForObjectLambda",
                "s3:ListBucketMultipartUploads",
                "s3:ListAllMyBuckets",
                "s3:ListAccessPoints",
                "s3:ListJobs",
                "s3:ListBucketVersions",
                "s3:ListMultiRegionAccessPoints",
                "s3:ListMultipartUploadParts"
                ]
                "Resource": "*"
            }
        ]
    }
  )
}

resource "aws_iam_role" "ec2_project_role" {
  name = var.role_name
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
     ]
   }
 )
}

resource "aws_iam_instance_profile" "project_profile" {
  name = var.profile_name
  role = aws_iam_role.ec2_project_role.name
}