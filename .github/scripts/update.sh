#!/usr/bin/env bash

LIDARR_URL="https://api.github.com/repos/Lidarr/Lidarr/releases"

FULL_LAST_VERSION=$(curl -SsL ${LIDARR_URL} | jq .[].name -r )
LAST_VERSION="${FULL_LAST_VERSION}"

sed -i -e "s|LIDARR_VERSION='.*'|LIDARR_VERSION='${LAST_VERSION}'|" Dockerfile*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
