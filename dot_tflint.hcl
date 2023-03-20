plugin "aws" {
  enabled = true
  version = "0.22.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
  enabled = true
  version = "0.2.2"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}
