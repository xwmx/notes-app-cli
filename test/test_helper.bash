###############################################################################
# test_helper.bash
#
# Test helper for Bats: Bash Automated Testing System.
#
# https://github.com/sstephenson/bats
###############################################################################

setup() {
  # `$_NOTES`
  #
  # The location of the script being tested.
  export _PROGRAM="${BATS_TEST_DIRNAME}/../notes-app"

  export _MY_DEFAULT_FOLDER_NAME="notes-app-cli-test"

  export _TMP_DIR
  _TMP_DIR="$(mktemp -d /tmp/notes-app_test.XXXXXX)" || exit 1

  export _MY_RC_PATH="${_TMP_DIR}/.notes-apprc"
  export _MY_HIGHLIGHT_COLOR=3

  if [[ -z "${EDITOR:-}" ]] || [[ ! "${EDITOR:-}" =~ mock_editor ]]
  then
    export EDITOR="${BATS_TEST_DIRNAME}/fixtures/bin/mock_editor"
  fi

  # Use empty `notes` script in environment to avoid depending on `notes`
  # being available in `$PATH`.
  export PATH="${BATS_TEST_DIRNAME}/fixtures/bin:${PATH}"

  if [[ ! "${_MY_RC_PATH}"   =~ ^/tmp/notes-app_test ]]
  then
    exit 1
  fi
}

teardown() {
  if [[ -n "${_TMP_DIR:-}" ]] &&
     [[ -e "${_TMP_DIR}"   ]] &&
     [[ "${_TMP_DIR}" =~ ^/tmp/notes-app_test ]]
  then
    rm -rf "${_TMP_DIR}"
  fi
}

###############################################################################
# Helpers
###############################################################################

# _compare()
#
# Usage:
#   _compare <expected> <actual>
#
# Description:
#   Compare the content of a variable against an expected value. When used
#   within a `@test` block the output is only displayed when the test fails.
_compare() {
  local _expected="${1:-}"
  local _actual="${2:-}"
  printf "expected:\\n%s\\n" "${_expected}"
  printf "actual:\\n%s\\n" "${_actual}"
}
