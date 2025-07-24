resource "aws_codebuild_project" "this" {
  name          = var.project_name
  description   = var.project_description
  service_role  = var.service_role_arn

  source {
    type      = var.source_type
    location  = var.source_location
    buildspec = var.buildspec
  }

  environment {
    compute_type    = var.compute_type
    image           = var.image
    type            = "LINUX_CONTAINER"
    privileged_mode = var.privileged_mode

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
        type  = "PLAINTEXT"
      }
    }
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  tags = var.tags
}
