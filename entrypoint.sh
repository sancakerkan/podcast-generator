#!/bin/bash

echo "==============="
# Set up Git configuration
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory "/github/workspace"

# Run the feed generation script
python3 /usr/bin/feed.py

# Check for changes and commit if there are any
git diff --exit-code || git add -A && git commit -m "Update Feed"

# Push changes to the repository (force if necessary)
git push --set-upstream origin main

echo "==============="
