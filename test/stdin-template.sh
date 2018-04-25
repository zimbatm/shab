#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

source ../shab

# Test that the template can be evaluated from stdin
FOO=xxxxx
result=$(shab - < stdin-template.shab)

[[ $result = xxxxx ]]
