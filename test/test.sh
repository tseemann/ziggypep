#!/usr/bin/env bats

setup () {
  name="ziggypep"
  bats_require_minimum_version 1.5.0
  dir=$(dirname "$BATS_TEST_FILENAME")
  cd "$dir"
  exe="$dir/../bin/$name"
}

@test "Script syntax check" {
  run -0 perl -c "$exe"
}
@test "Version" {
  run -0 $exe -v
  [[ "$output" =~ "$name " ]]
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
@test "Null input" {
  run ! $exe /dev/null
  [[ "$output" =~ "ERROR" ]]
}
@test "Uncompressed input" {
  run -0 $exe pos.faa
  [[ "$output" =~ "PHL2_BACCE" ]]
  [[ ! "$output" =~ "WARNING" ]]
}
@test "Gzipped input" {
  run -0 $exe test.faa.gz
  [[ "$output" =~ "WP_016198974.1" ]]
  [[ "$output" =~ "has non" ]]
}
@test "Bzipped input" {
  run -0 $exe neg.faa.bz2
  [[ "$output" =~ "CYOD_ECOLI" ]]
  [[ "$output" =~ "does not" ]]
}
@test "STDIN input" {
  run -0 $exe /dev/stdin < neg.faa.bz2
  [[ "$output" =~ "is $name" ]]
}
@test "Quiet mode -q" {
  run -0 $exe -q pos.faa
  [[ ! "$output" =~ "is $name" ]]
}
@test "Signals only -s" {
  run -0 $exe -s pos.faa
  [[ ! "$output" =~ "LSHR_RAT" ]]
}
