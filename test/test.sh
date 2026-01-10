#!/usr/bin/env bats

setup () {
  bats_require_minimum_version 1.5.0
  dir=$(dirname "$BATS_TEST_FILENAME")
  cd "$dir"
  exe="$dir/../bin/ziggypep"
}
@test "Script syntax check" {
  run -0 perl -c "$exe"
}
@test "Version" {
  run -0 $exe -v
  [[ "$output" =~ "ziggypep" ]]
}
@test "Help" {
  run -0 $exe -h
  [[ "$output" =~ "peptide" ]]
}
@test "Ciiation" {
  run -0 $exe -C
  [[ "$output" =~ "Seemann" ]]
}
@test "No parameters" {
  run ! $exe
}
@test "Bad option" {
  run ! $exe --doesnotexist
}
