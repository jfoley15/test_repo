#!/bin/bash

set -e

repo_count=$(find . -type d -maxdepth 1 2>/dev/null | grep -c -v '^.$')
readme_count=$(find . -type f -name 'README.md' -maxdepth 2 2>/dev/null | wc -l)
echo readme_count is $readme_count
echo repo_count is $repo_count
status="success"
if (( repo_count != readme_count )); then
  status="failure"
fi
echo status is $status
echo "status=$status" >> "$GITHUB_OUTPUT"