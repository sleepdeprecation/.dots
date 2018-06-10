alias tfvars="jq '[.modules[0].outputs | to_entries[] | .value = .value.value] | from_entries '"
