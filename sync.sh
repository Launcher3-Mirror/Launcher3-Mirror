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

echo "Resetting $BRANCH to $UPSTREAM/$BRANCH..."
git checkout $BRANCH sync.sh
git reset --hard $UPSTREAM/$BRANCH

echo "Making push in $ORIGIN..."
git push $ORIGIN $BRANCH --force
