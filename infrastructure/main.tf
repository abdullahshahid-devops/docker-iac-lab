terraform {
  required_version = ">= 1.0"
}

resource "terraform_data" "docker_iac_lab" {
  input = "Docker IaC lab configuration verified"
}

output "lab_message" {
  value = terraform_data.docker_iac_lab.output
}
