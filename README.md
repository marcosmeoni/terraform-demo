# terraform-demo

Demo Terraform cluster — non-production end-to-end IaC test.

## Structure

```
.
├── envs/
│   └── demo/          # Demo environment (safe, non-prod)
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── modules/
│   └── demo-cluster/  # Reusable module: fake/mock cluster
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md
```

## Usage

### Plan

```bash
cd envs/demo
terraform init
terraform plan -out=tfplan
```

### Apply

```bash
terraform apply tfplan
```

### Rollback / Destroy

```bash
# To destroy all demo resources safely:
terraform destroy -auto-approve

# Or revert to a previous state snapshot:
terraform state list
terraform state rm <resource>  # remove specific resource from state
git revert HEAD~1              # revert IaC changes via git
```

## Notes

- This is a **demo/non-prod** environment. No real cloud resources are created by default.
- The cluster module uses `null_resource` to simulate cluster creation without real cloud API calls.
- To target real infrastructure, replace the `null_resource` blocks in `modules/demo-cluster/main.tf` with your cloud provider resources and configure the appropriate provider in `envs/demo/main.tf`.

## Safety Guardrails

- No production (`prd`) workspace is referenced here.
- Terraform state is local by default — add a remote backend before sharing.
- IAM: no wildcard policies. Least-privilege principle.
