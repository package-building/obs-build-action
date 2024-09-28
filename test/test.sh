#!/bin/bash
set -eu

bats --jobs 1 --recursive "${WORKSPACE}/test" "$@"
