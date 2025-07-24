
# 🚀 AWS DevSecOps Terraform Modules

This repository contains reusable Terraform modules to provision an AWS DevSecOps infrastructure including:

- 🐳 **ECS Module:** Manage ECS clusters, task definitions, services, and networking  
- 🔥 **ALB Module:** Application Load Balancer with listeners, target groups, and security groups  
- 🛠️ **CodeBuild Module:** Build environment for CI/CD with IAM roles and environment variables  
- 📦 **CodePipeline Module:** Multi-stage CI/CD pipeline integrating source control, build, and deployment  


## 🗂️ Module Structure

Each module is self-contained with:

- `main.tf`: Resource definitions  
- `variables.tf`: Input variables with descriptions  
- `outputs.tf`: Outputs for integration  

## ⚙️ Setup Instructions

1. **Configure AWS CLI** with appropriate credentials  
2. **Edit `root/variables.tf`** to customize deployment parameters  
3. Run Terraform commands:

```
terraform init
terraform plan
terraform apply
```

Folder Structure

```
aws-devsecops-test/
├── ecs/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── alb/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── codebuild/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── codepipeline/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── root/
│   ├── main.tf
│   └── variables.tf
└── buildspec.yml
```

📦 Example Usage
The root module imports and wires all submodules with customizable variables:
```
module "ecs" {
  source = "../ecs"
  cluster_name = var.cluster_name
  ...
}
```

📝 Buildspec Example
Create a buildspec.yml for CodeBuild like:
```
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 14
  build:
    commands:
      - echo "Building project"
      - npm install
      - npm run build
artifacts:
  files:
    - '**/*'
  base-directory: build
  ```

🏗️ Architecture Diagram

```
+----------------------+        +------------------------+
|                      |        |                        |
|  GitHub / Source Repo |------->|  AWS CodePipeline      |
|                      |        |                        |
+----------------------+        +-----------+------------+
                                         |
                                         v
                             +------------------------+
                             |                        |
                             |  AWS CodeBuild         |
                             |  (Build & Test)        |
                             +-----------+------------+
                                         |
                                         v
                             +------------------------+
                             |                        |
                             |  ECS Cluster + Service  |
                             |  (Run containers)      |
                             +-----------+------------+
                                         |
                                         v
                             +------------------------+
                             |                        |
                             |  Application Load      |
                             |  Balancer (ALB)        |
                             +------------------------+
```

🔐 Security Best Practices

- Use least privilege IAM roles
- Encrypt sensitive data with KMS
- Use private subnets for task networking (optional)
- Enable CloudWatch logging and monitoring

📧 Contact
For questions or issues, please contact:

DevOps Team - [ervanstwan@gmail.com]
