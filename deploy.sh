#!/bin/sh

# If a command fails then the deploy stops
set -e

# Copy _book to published book repo
printf "\033[0;32mCopying _book to published book repo...\033[0m\n"
cp -r _book/. ../Book-CS2

# Change to published book repo
printf "\033[0;32mMove into to published book directory...\033[0m\n"
cd ../Book-CS2

# Add changes to git.
printf "\033[0;32mStaging changes...\033[0m\n"
git add .

# Commit changes.
msg="rebuilding site $(date)"
git commit -m "$msg"

# Push source and build repos.
printf "\033[0;32mPushing to GitHub...\033[0m\n"
git push

# Return back to source build repo
printf "\033[0;32mSwitch back to source build repo...\033[0m\n"
cd ../CS2/