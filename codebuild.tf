resource "aws_codebuild_project" "this" {
  name         = "my-codebuild-project"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  source {
    type      = "GITHUB"
    location  = "https://github.com/ervanstwan/aws-devsecops"
    buildspec = "buildspec.yml"
  }
}
