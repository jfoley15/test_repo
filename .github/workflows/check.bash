#!/bin/bash

set -e

repo_count=$(find ./* -maxdepth 0 -type d | wc -l)
readme_count=$(find ./*/AUTHORS.txt -maxdepth 0 -type f | wc -l)
echo readme_count is $readme_count
echo repo_count is $repo_count
status="success"
if (( repo_count != readme_count )); then
  status="failure"
fi
echo status is $status
echo "status=$status" >> "$GITHUB_OUTPUT"