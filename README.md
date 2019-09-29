# CORE Language Test Files

A collection of files to test an interpreter for the CORE toy programming
language. Not official; please use according to your own best judgement.


## How to run

```sh
git clone https://github.com/zqianem/corelang-test-files.git 
cd corelang-test-files

./run_tests.sh [path to your interpreter]
```

You may need to modify this slightly depending on your system.


## Test and naming conventions

### Directories

Used to group related tests, name with all-lowercase words separated by hypens
if necessary.

### Valid tests

Valid tests are those that are expected to run in the interpreter without error
and produce the output specified in the project guidelines.

The name of a valid test is a all-lowercase single word, optionally followed by
a number, and cannot contain `bad` as a substring. The test itself consists of
three files with its name and the suffixes `.code`, `.data`, and `.expected`,
respectively.  

###  Invalid tests

Invalid tests are those tests that have code containing lexical, syntactical, or
semantic errors, which should prematurely stop interpreter output with a line
containing `ERROR: {some_description}`.

The name of an invalid test is either `badlex`, `badsyn`, or `badsem`,
corresponding to the type of error it is expected to produce (type of error not
checked for in the provided scripts), optionally followed by a number. The test
itself consists of two files with its name and the suffixes `.code` and `.data`.
(Data file required even if empty.)

### General

If a test warrants additional explanation that may not be obvious from its name
or code, a file named `{test_name}.remarks` can be included.


## Contributing

More tests are always better! Fork this repository and open a pull request to
contribute. Please follow the test and naming conventions outlined above.
