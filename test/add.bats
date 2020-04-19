#!/usr/bin/env bats

load test_helper

@test "\`add\` exits with 0 and adds note." {
  run "${_PROGRAM}" add --name "Example Name" --body "Example body."
  printf "\${lines[*]}: %s\\n" "${lines[*]}"
  printf "\${#lines[@]}: %s\\n" "${#lines[@]}"

  [[ ${status} -eq 0 ]]

  [[ "${lines[0]}" =~ note\ id ]]
}
