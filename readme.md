# Terraform
Terraform is used to `create`, `manage`, and `update infrastructure resources` such as `physical machines`, `VMs`, `network switches`, `containers`, and more. Terraform is an `IaC` tool which stands for `Infrastructure as code` similiar to CloudFormation by Amazon.

## Prerequisite
- Make sure you have set up Terraform CLI on your machine
- Make sure you have an AWS account, and have the AWS CLI installed
- Set up a limited user on AWS for terraform functionality
- Configured AWS CLI to use your limited user with the correct `ACCESS_KEY` and `SECRET`

## Usage
The project has been set up with an empty package.json file so therefore allows us to use scripts to simplify workflow.

### Set-up
- Run `yarn tf:init` to get aws provider plugin downloaded
- Run `yarn tf:plan` to see changes that will be made
- Run `yarn tf:apply` to actually make those changes to your provider
- Visit AWS and see all your services provisioned via terraform
- Run `yarn tf:destroy` to destroy all the services that were built

### Commands

#### Init
This command is used to set up terraform and download the correct provider plugin to allow for terraform to be used. This should only need to be ran once and will set up everything in a `.terraform` folder.

**Command:** `yarn tf:init` - would run `terraform init`

#### Plan
The Plan command is used to generate and show an execution plan of what will be built, it wont actually apply those changes. Its a way of seeing what would happen.

**Command:** `yarn tf:plan` - would run `terraform plan`

#### Apply
This command will actually be used to apply the changes you will have seen in the plan command. This can be destructive as actual stuff will be provisioned together.

**Command:** `yarn tf:apply` - would run `terraform apply`

#### Destroy
As the command may indicate this is used to destroy the terraform builds, it will destroy all the provisoned services from provider.

**Command:** `yarn tf:destroy` - would run `terraform destroy`

## Provider
Providers are responsible for understanding API interactions and exposing resources. Examples of some Providers include AWS, GCP, Microsoft Azure.

## State
The state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate", but it can also be stored remotely, which works better in a team environment.

Terraform uses this local state to create plans and make changes to your infrastructure.