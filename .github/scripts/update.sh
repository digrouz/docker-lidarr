#!/usr/bin/env bash

LIDARR_URL="https://api.github.com/repos/Lidarr/Lidarr/releases"

FULL_LAST_VERSION=$(curl -SsL ${LIDARR_URL} | jq -c '.[] | select( .prerelease == false )'  | jq .name -r | head -1 )
LAST_VERSION="${FULL_LAST_VERSION}"

if [ "${LAST_VERSION}" ];then
  sed -i -e "s|LIDARR_VERSION='.*'|LIDARR_VERSION='${LAST_VERSION}'|" Dockerfile*
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
