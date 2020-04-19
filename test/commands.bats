#!/usr/bin/env bats

load test_helper

@test "\`commands\` exits with 0 and prints subcommands." {
  run "${_PROGRAM}" commands
  printf "\${lines[*]}: %s\\n" "${lines[*]}"
  printf "\${#lines[@]}: %s\\n" "${#lines[@]}"

  [[ ${status} -eq 0 ]]

  [[ "${lines[0]}" =~ add ]]
}

