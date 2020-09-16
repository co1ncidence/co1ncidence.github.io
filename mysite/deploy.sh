#!/bin/sh

# If a command fails then the deployment stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project
hugo

# Go To Website Folder
cd ..

# Stage everything
git add .

# Commit 
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push to master
git push origin master
