#!/bin/bash

UPSTREAM="upstream"
ORIGIN="origin"
BRANCH="main"

if [ "$1" == "github" ]; then
  echo "Configuring..."
  git remote add $UPSTREAM https://android.googlesource.com/platform/packages/apps/Launcher3
fi

echo "Fetching $UPSTREAM..."
git fetch $UPSTREAM

echo "Merging $UPSTREAM in $BRANCH..."
git merge $UPSTREAM/$BRANCH --allow-unrelated-histories

echo "Making push in $ORIGIN.."
git push $ORIGIN $BRANCH
