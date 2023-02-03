# cloud-k8s
Deploys a baseline Kubernetes cluster with standard set of services enabled.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) 0.12.0+
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) 2.0.0+

## Usage

1. Create a Service Principal
```bash
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```

2. Create a `terraform.tfvars` file with the following variables:
```hcl
subscription_id = "<SUBSCRIPTION_ID>"
client_id       = "<CLIENT_ID>"
```

3. Initialize Terraform
```bash
terraform init
```

4. Create a plan
```bash
terraform plan -var-file=terraform.tfvars
```

5. Apply the plan
```bash
terraform apply -var-file=terraform.tfvars
```
