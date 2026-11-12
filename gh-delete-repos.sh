#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 owner/repo1 owner/repo2 ..."
  exit 1
fi

echo "以下のリポジトリを削除します:"
printf '  %s\n' "$@"

for repo in "$@"; do
  echo ""
  echo "Deleting: $repo"

  if gh repo delete "$repo" --yes; then
    echo "Deleted: $repo"
  else
    echo "Failed: $repo" >&2
  fi
done
