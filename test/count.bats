#!/usr/bin/env bats

load test_helper

@test "\`count\` exits with 0." {
  run "${_PROGRAM}" count
  printf "\${lines[*]}: %s\\n" "${lines[*]}"
  printf "\${#lines[@]}: %s\\n" "${#lines[@]}"

  [[ ${status} -eq 0 ]]
}
