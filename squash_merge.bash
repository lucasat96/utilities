#!/bin/bash

################################################################################
# Squash Merge Helper Script (Generic)
#
# This script assists in performing a squash merge from a development branch
# into a main branch within any Git repository.
#
# It:
#   - Displays the git status of both branches.
#   - Asks for confirmation before proceeding.
#   - Performs a squash merge from the development branch to the main branch.
#   - Commits the squash merge with the provided commit message.
#   - Returns to the development branch and the original directory after the operation.
#
# Usage:
#   ./squash_merge.sh "Commit message" [main_branch] [dev_branch]
#
# Arguments:
#   1. Commit message (required)
#   2. Main branch name (optional, default: "main")
#   3. Development branch name (optional, default: "dev")
#
# Example:
#   ./squash_merge.sh "Tested feature X" main feature_x_dev
################################################################################

# Check for commit message
if [ -z "$1" ]; then
    echo "❌ Error: You must provide a commit message."
    echo "Usage: $0 \"Your commit message\" [main_branch] [dev_branch]"
    read -p "Press Enter to exit..."
    exit 1
fi

COMMIT_MSG="$1"
MAIN_BRANCH="${2:-main}"
DEV_BRANCH="${3:-dev}"

# Save current directory
ORIGINAL_DIR=$(pwd)

echo "----- Checking out '$DEV_BRANCH' -----"
git checkout "$DEV_BRANCH" || exit 1
echo "----- Git status for '$DEV_BRANCH' -----"
git status

echo ""
echo "----- Checking out '$MAIN_BRANCH' -----"
git checkout "$MAIN_BRANCH" || exit 1
echo "----- Git status for '$MAIN_BRANCH' -----"
git status

echo ""
read -p "Proceed with squash merge from '$DEV_BRANCH' into '$MAIN_BRANCH'? (y/N): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "----- Performing squash merge -----"
    git merge --squash "$DEV_BRANCH" || exit 1
    git commit -m "$COMMIT_MSG"
    echo "✅ Squash merge committed with message: $COMMIT_MSG"
else
    echo "❌ Merge aborted."
fi

echo ""
echo "----- Returning to '$DEV_BRANCH' -----"
git checkout "$DEV_BRANCH"

# Return to original directory
cd "$ORIGINAL_DIR" || exit 1
echo "Returned to $ORIGINAL_DIR"
