#!/usr/bin/env bats

load test_helper

@test "\`count\` exits with 0 and adds note." {
  run "${_PROGRAM}" count
  printf "\${lines[*]}: %s\\n" "${lines[*]}"
  printf "\${#lines[@]}: %s\\n" "${#lines[@]}"

  [[ ${status} -eq 0 ]]

  [[ "${lines[0]}" == "0" ]]
}
