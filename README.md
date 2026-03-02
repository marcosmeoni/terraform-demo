# terraform-demo

Demo Terraform cluster — non-production end-to-end IaC test.

## Structure

```
.
├── envs/
│   └── demo/
│       ├── locals.tf       # Common tags (added via Cursor CLI, model auto)
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── modules/
│   └── demo-cluster/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md
```

## Usage

### Plan
```bash
cd envs/demo && terraform init && terraform plan -out=tfplan
```

### Apply
```bash
terraform apply tfplan
```

### Rollback / Destroy
```bash
terraform destroy -auto-approve
git revert HEAD~1
```

## Safety Guardrails
- null_resource: no real cloud calls
- environment validation blocks prd/prod/production
- No wildcard IAM policies
- Local state by default
