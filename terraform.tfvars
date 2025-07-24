region                 = "ap-southeast-1"
subnets                = ["subnet-08af7e848fb01fd4b","subnet-0b2953390e3a95501","subnet-03d5839f0ba3b2bdf"]
vpc_id                 = "vpc-0949919da91520f2c"
service_role_arn       = "arn:aws:iam::512742310782:role/ecsTaskExecutionRole"
codebuild_project_name = "my-codebuild-project"
project_description    = "My CodeBuild project"
source_location        = "https://github.com/ervanstwan/aws-devsecops"
buildspec            = "buildspec.yml"
tags                 = {
  Environment = "dev"
  ManagedBy   = "terraform"
}




