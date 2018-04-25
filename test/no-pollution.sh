#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

source ../shab

# Test that the template scope is isolated
shab no-pollution.shab >/dev/null


[[ -z ${FOO:-} ]]
