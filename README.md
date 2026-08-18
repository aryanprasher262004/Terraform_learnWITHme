# Terraform Learn With Me 🚀

A practical repository documenting my journey of learning **Terraform and Infrastructure as Code (IaC)** through hands-on labs.

The goal of this repository is not just to store Terraform configuration files, but to document **what I learn, what I build, the problems I encounter, and how I solve them**.

If you're learning Terraform too, you can follow these labs alongside me.

---

## 🎯 Purpose of This Repository

I am learning Terraform by combining:

* 📖 Understanding Terraform concepts
* 💻 Writing Terraform configurations
* ☁️ Provisioning real infrastructure on AWS
* 🧪 Performing hands-on labs
* 🐛 Documenting errors and their solutions
* 📝 Creating detailed learning notes
* 🔐 Learning cloud and IaC best practices
* 💰 Keeping student labs cost-conscious
* 🔄 Improving the configurations as I learn more

Instead of only watching tutorials, my approach is:

> **Learn → Understand → Build → Break → Fix → Document → Repeat**

---

## 🧠 What is Terraform?

**Terraform** is an Infrastructure as Code (IaC) tool created by HashiCorp.

It allows infrastructure to be defined using configuration files instead of manually creating everything through cloud provider consoles.

For example, an AWS EC2 instance can be described using Terraform:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t3.micro"
}
```

Terraform can then determine the changes required to make the actual infrastructure match the configuration.

---

## 🏗️ What is Infrastructure as Code?

Infrastructure as Code allows infrastructure such as:

* Virtual machines
* Networks
* Databases
* Storage
* IAM resources
* DNS
* Cloud services

to be defined and managed using code.

Instead of:

```text
Developer
    ↓
AWS Console
    ↓
Manually create resources
```

we can use:

```text
Terraform Configuration
        ↓
Terraform
        ↓
Cloud Provider
        ↓
Infrastructure
```

This makes infrastructure more **repeatable, reviewable, version-controlled and automatable**.

---

## ☁️ Current Learning Environment

My current practical environment uses:

| Tool      | Purpose                               |
| --------- | ------------------------------------- |
| Terraform | Infrastructure as Code                |
| AWS       | Cloud platform                        |
| AWS CLI   | AWS authentication and CLI operations |
| IAM       | Access control for Terraform          |
| Git       | Version control                       |
| GitHub    | Lab and documentation repository      |
| VS Code   | Editing Terraform configuration       |

Terraform authentication is configured through an AWS CLI profile rather than storing AWS credentials inside Terraform files.

```text
Terraform
    ↓
AWS Provider
    ↓
AWS CLI Profile
    ↓
IAM User
    ↓
AWS
```

---

## 📚 Repository Structure

Each major lesson or practical exercise gets its own directory.

```text
Terraform_learnWITHme/
│
├── README.md
├── .gitignore
│
├── overview01/
│   ├── main.tf
│   └── .terraform.lock.hcl
│
├── lesson02/
│   └── ...
│
└── ...
```

The structure will grow as I progress through Terraform.

Each lab may contain:

* Terraform configuration
* Commands used
* Explanations
* Experiment results
* Errors encountered
* Fixes
* Important observations

---

## 🧪 Lab 01 — Terraform Overview & First EC2 Instance

The first practical lab covers the basic structure of a Terraform AWS configuration.

### Topics Covered

* Terraform configuration syntax
* HCL basics
* Terraform blocks
* `required_providers`
* AWS provider
* AWS regions
* AWS CLI profiles
* Terraform resources
* EC2 instances
* Amazon Machine Images (AMI)
* EC2 instance types
* Terraform resource addresses
* Terraform execution plans

### Basic Configuration

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "terraform-course"
}

resource "aws_instance" "example" {
  ami           = "<AMI_ID>"
  instance_type = "t3.micro"
}
```

> AMI IDs are region-specific and may change over time. Always verify the correct AMI for your selected AWS region rather than blindly copying an old AMI ID.

### Commands Practiced

```bash
terraform fmt

terraform init

terraform validate

terraform plan

terraform apply
```

The first successful deployment resulted in:

```text
Plan: 1 to add, 0 to change, 0 to destroy.

Apply complete!
Resources: 1 added, 0 changed, 0 destroyed.
```

This created my first AWS EC2 instance managed through Terraform.

---

## 🔄 Basic Terraform Workflow

A simple workflow followed throughout the labs is:

```text
Write Configuration
        ↓
terraform fmt
        ↓
terraform init
        ↓
terraform validate
        ↓
terraform plan
        ↓
Review Changes
        ↓
terraform apply
        ↓
Experiment / Learn
        ↓
terraform destroy
```

One of the most important habits when learning with real cloud resources is to **review the plan before applying changes**.

---

## 📝 Learning Notes

Alongside the Terraform configuration files, I am creating detailed notes explaining the concepts covered in each lesson.

The documentation is intended to explain not only:

> **What command did I run?**

but also:

> **What does it do, why is it required, and what happens behind the scenes?**

As the repository grows, I plan to document topics such as:

```text
Providers
Resources
Terraform State
Variables
Outputs
Data Sources
Dependencies
Lifecycle
Modules
Remote State
AWS Infrastructure
Terraform Best Practices
```

The documentation will evolve with my understanding.

---

## 🐛 Errors Are Part of the Repository

This repository will also document mistakes and problems encountered during practical labs.

For example, while creating the first EC2 instance, the Terraform deployment succeeded but the instance initially appeared to be missing from the AWS Console.

The issue was simple:

```text
Terraform Region → ap-south-1 (Mumbai)

AWS Console Region → us-east-1 (N. Virginia)
```

AWS resources such as EC2 instances are regional.

Switching the AWS Console to **Mumbai (`ap-south-1`)** showed the instance successfully.

These kinds of practical problems are useful learning experiences, so I want to document them instead of only showing the final working configuration.

---

## 🔐 Security

Cloud credentials should **never be committed to GitHub**.

This repository intentionally excludes files that may contain sensitive or machine-specific Terraform information.

Examples include:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
.env
.env.*
```

The Terraform provider dependency lock file:

```text
.terraform.lock.hcl
```

is intentionally version controlled.

AWS Access Keys and Secret Access Keys should never appear in Terraform source files.

---

## 💰 AWS Cost Warning

Some labs in this repository create **real AWS infrastructure**.

Terraform itself does not make an AWS resource free.

AWS pricing, Free Tier eligibility and promotional credits can change over time.

Before running:

```bash
terraform apply
```

always inspect:

```bash
terraform plan
```

and understand which resources Terraform intends to create.

After completing temporary labs, resources should be destroyed when they are no longer required:

```bash
terraform destroy
```

Always verify the AWS Console afterward when working with resources that may generate charges.

---

## ⚠️ Learning Repository Disclaimer

This repository represents my **learning journey**, not a production-ready Terraform architecture.

Some configurations may intentionally remain simple because they correspond to concepts being introduced at that stage of learning.

As I learn more advanced Terraform practices, earlier approaches may be improved or replaced.

If you're following along, always verify:

* Current Terraform documentation
* Current AWS provider documentation
* AWS pricing
* AWS Free Tier eligibility
* Security best practices
* Current resource availability

before deploying infrastructure.

---

## 🤝 Learn With Me

This repository is called **Terraform Learn With Me** because I want it to be more than a collection of my lab files.

If you're also learning:

**Terraform • AWS • DevOps • Cloud • Infrastructure as Code**

you can follow the repository and work through the labs alongside me.

I'll continue adding configurations, explanations, mistakes, fixes and learning notes as I progress.

---

## 📈 Progress

```text
[✓] Terraform environment setup
[✓] AWS CLI configuration
[✓] Dedicated IAM user for Terraform
[✓] AWS provider configuration
[✓] Basic Terraform configuration
[✓] terraform init / fmt / validate
[✓] terraform plan
[✓] First terraform apply
[✓] First EC2 instance
[ ] Terraform State
[ ] Variables
[ ] Outputs
[ ] Data Sources
[ ] Dependencies
[ ] Modules
[ ] Remote State
[ ] More AWS infrastructure
```

More labs coming as I continue learning. 🚀

---

## ⭐ Final Goal

By the end of this journey, I want to be able to move from:

```text
"I know Terraform commands."
```

to:

```text
"I understand how Terraform manages infrastructure
and can confidently build reproducible cloud infrastructure with it."
```

**Learn it. Build it. Break it. Understand it. Document it.**
