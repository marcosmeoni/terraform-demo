# terraform-demo

Demo Terraform cluster — non-production end-to-end IaC test.

## Structure

```
.
├── envs/
│   └── demo/
├── modules/
│   └── demo-cluster/
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
# Or via git:
git revert HEAD~1
```

## Safety Guardrails
- Non-prod only (module enforces this via validation)
- No real cloud resources created (null_resource based)
- No wildcard IAM policies
- Local state by default
