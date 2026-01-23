plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Do NOT block CI yet
rule "terraform_required_version" {
  enabled  = true
  severity = "warning"
}

rule "terraform_required_providers" {
  enabled  = true
  severity = "warning"
}

rule "terraform_typed_variables" {
  enabled  = true
  severity = "warning"
}

rule "terraform_deprecated_lookup" {
  enabled  = true
  severity = "warning"
}
