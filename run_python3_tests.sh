#!/bin/sh

if [ "$1" = "" ]
then
  echo Tests not run, missing first argument
  echo usage: $0 [path_to_interpreter_script]
  exit 1
fi

if [ $# -gt 1 ]
then
  echo Ignoring extra arguments beyond the first...
fi

if ! hash "$1" 2>/dev/null
then
  echo Tests not run, could not find command "$1"
  exit 1
fi

tests="**/*.code"

for t in $tests
do
  t=${t%\.code}
  code=$t.code
  data=$t.data
  expected=$t.expected

  if [ ! -f $data ]
  then
    data=empty.data
  fi

  printf "Testing %s... " "$t"

  if [ $t != "${t%bad*}" ]
  then
    output=$(python3 $1 $code $data)
    if [ "$output" != "${output%ERROR:*}" ]
    then
      printf "\033[0;32mPASSED\033[0m\n"
    else
      printf "\033[0;31mFAILED\033[0m\n"
      printf "\033[1mexpected error, got following output:\033[0m\n"
      echo "$output"
    fi
  else
    output=$(python3 $1 $code $data | diff -u - $expected)
    if [ $? -eq 0 ]
    then
      printf "\033[0;32mPASSED\033[0m\n"
    else
      printf "\033[0;31mFAILED\033[0m\n"
      echo "$output"
    fi
  fi
done
