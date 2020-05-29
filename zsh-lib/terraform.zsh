alias tfvars="jq '[.modules[0].outputs | to_entries[] | .value = .value.value] | from_entries '"

function tf-ip() {
  terraform state show -no-color "aws_instance.$1" | awk '$1 == "public_ip" {print substr($3, 2, length($3)-2)}'
}

function tf-ssh() {
  # ip=$(terraform state show -no-color "aws_instance.$1" | awk '$1 == "public_ip" {print substr($3, 2, length($3)-2)}')
  ip=$(tf-ip $1)
  ssh ubuntu@"$ip"
}
