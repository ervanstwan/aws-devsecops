resource "aws_iam_role" "codebuild_role" {
  name = "my-codebuild-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "codebuild.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "terraform_role_policy" {
  name        = "terraform-role"
  description = "Policy for Terraform execution"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "codebuild:*",
          "ecs:*",
          "iam:*",
          "sts:AssumeRole"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codebuild_attach_terraform_role" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.terraform_role_policy.arn
}
