package env0

format(meta) := meta.description
format(meta, context) := meta.description + " " + context

# Helper
any_other_approver[i] {
  input.approvers[j].email != input.approvers[i].email
  i != j
}

# METADATA
# title: separation of duties
# description: wait for secondary approval (deployer cannot be approver)
pending[format(rego.metadata.rule())] {
  some i
  input.deployerUser.email == input.approvers[i].email
  not any_other_approver[i]
}

# METADATA
# title: separation of duties
# description: approver is not deployer 
allow[format(rego.metadata.rule(), input.approvers[i].email)] {
  some i
  input.deployerUser.email != input.approvers[i].email
}
