#!/bin/bash

# Function to pull from a git repository
pull_git_repo() {
    if [ -d "$1/.git" ]; then
        echo "Pulling latest changes in $1..."
        cd "$1" || exit
        git pull origin $(git rev-parse --abbrev-ref HEAD)
        cd - || exit
    fi
}

# Find all directories with a .git subdirectory and pull from them
export -f pull_git_repo
find . -type d -exec bash -c 'pull_git_repo "$0"' {} \;

echo "All repositories updated!"
