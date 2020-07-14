# terraform-workspace-poc
POC to understand using Terraform Workspace

This POC creates local-file resources for a given workspace. Given the same Terraform configuration file and separate variable values for each workspace, creates resources.

## Steps:
1. `terraform init`
2. Create a [workspace](https://www.terraform.io/docs/commands/workspace/new.html) `terraform workspace new east`
3. `terraform apply -var-file="east.tfvars"`
4. `terraform workspace new west`
5. `terraform apply -var-file="west.tfvars"`



## For the example variables:
```
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

## Consul Backend

To use Consul backend,
1. start up consul server agent with `consul agent -dev` (no configuration needed)
2. Uncomment out consul-backend block in `main.tf`
3. Do Terraform CLI steps listed above

After running steps, separate state files for each workspace will be in KV store at `network/terraform-env:<workspace-name>`

## Terraform Cloud Backend

**Set up Terraform Cloud**
1. Create Terraform Cloud Account at https://app.terraform.io/session (Confirm confirmation email)
2. Create organization "network"
3. Create new workspace "instance-east" with "No VCS connection"
4. Update "instance-west" workspace: Settings > General > Execution Mode > Local > Save settings
5. Repeat steps 3 & 4 to create workspace "instance-west"

**Authenticate**
1. Run `terraform login`
2. Follow prompt to copy token from opened browser into CLI prompt

**Update workspace**

Follow steps listed in "Steps" section