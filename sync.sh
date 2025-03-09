#!/bin/bash

UPSTREAM="upstream"
ORIGIN="origin"
BRANCH="main"

# Configure upstream if 'github' is passed as argument
if [ "$1" == "github" ]; then
  echo "Configuring..."
  git remote add $UPSTREAM https://android.googlesource.com/platform/packages/apps/Launcher3
fi

# Fetch latest updates from upstream
echo "Fetching $UPSTREAM..."
git fetch $UPSTREAM

# Check if there are local changes and stash or discard them
echo "Checking for local changes..."

# Stash changes (you can also choose to discard changes)
git diff --quiet || git stash

# Checkout the branch
echo "Checking out branch $BRANCH..."
git checkout $BRANCH

# Reset the local branch to match upstream
echo "Resetting $BRANCH to $UPSTREAM/$BRANCH..."
git reset --hard $UPSTREAM/$BRANCH

# Check if the local branch exists
echo "Checking if the local branch exists..."
git branch | grep -w "$BRANCH" || git checkout -b $BRANCH  # Create the branch if it doesn't exist

# Push the changes to the origin repository
echo "Pushing changes to $ORIGIN..."
git push $ORIGIN $BRANCH --force
