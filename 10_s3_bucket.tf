# create private s3 bucket for ecs 

resource "aws_s3_bucket" "s3_ecs_bucket" {
  acl    = "private"
}

# iam policy to define S3 permissions

data "aws_iam_policy_document" "s3_ecs_bucket_policy" {
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_ecs_bucket.bucket}"
    ]
  }
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_ecs_bucket.bucket}/*"
    ]
  }
}

# aws iam policy

resource "aws_iam_policy" "ecs_s3_policy" {
  name   = "ecs-s3-policy"
  policy = data.aws_iam_policy_document.s3_ecs_bucket_policy.json
}

# This attaches a iam policy to iam role

resource "aws_iam_role_policy_attachment" "ecs_role_s3_ecs_bucket_policy_attach" {
  role       = aws_iam_role.ecs_service_role.name
  policy_arn = aws_iam_policy.ecs_s3_policy.arn
}


