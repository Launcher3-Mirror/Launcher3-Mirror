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

# First, checkout the branch
echo "Checking out branch $BRANCH..."
git checkout $BRANCH

# If there are local changes to sync.sh, restore it
echo "Restoring sync.sh to the state of the branch..."
git checkout -- sync.sh

# Now reset the local branch to align with the upstream branch
echo "Resetting $BRANCH to $UPSTREAM/$BRANCH..."
git reset --hard $UPSTREAM/$BRANCH

# Push the changes to the origin repository
echo "Pushing changes to $ORIGIN..."
git push $ORIGIN $BRANCH --force
