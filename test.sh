#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

run() {
  echo "Running $1:"
  $1
  echo "  OK"
}

for file in test/*.sh; do
  run "$file"
done
