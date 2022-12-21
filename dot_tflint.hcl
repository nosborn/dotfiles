plugin "aws" {
  enabled = true
  version = "0.21.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
  enabled = true
  version = "0.2.1"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}
