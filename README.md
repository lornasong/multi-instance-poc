# terraform-workspace-poc
POC to understand using Terraform Workspace

This POC creates local-file resources for a given workspace. Given the same Terraform configuration file and separate variable values for each workspace, creates resources.

Steps:
```
terraform init

// create a workspace https://www.terraform.io/docs/commands/workspace/new.html
terraform workspace new east

// create resources for workspace
terraform apply -var-file=example.tfvars

// create a new workspace
terraform workspace new west

terraform apply -var-file=example.tfvars
```

For the example variables:
```
service_mapping = {
  west = ["web1", "web2"]
  east = ["web1"]
}

services = {
  web1: {
    name = "web1"
    address = "192.0.0.1:8000"
  },
  web2: {
    name = "web2"
    address = "192.0.0.13:5000"
  }
}
```
In the `west` workspace, Terraform apply creates a `web1` and `web2` resource (text file) with related attributes (ip address in the text file)

In the `east` workspace, Terraform apply creates only the `web1` resource (text file) with related attributes (ip address in the text file)