alias tfvars="jq '[.modules[0].outputs | to_entries[] | .value = .value.value] | from_entries '"

function tf-ssh() {
    ip=$(terraform state show "aws_instance.$1" | awk '$1 == "public_ip" {print $3}')
    ssh $ip
}
