#!/bin/sh
#
# Automatically adds branch name and branch description to every commit post commit message.
# Edit .git/hooks/post-commit & make sure it is excutable chmod +x
# Requires git config --add remote.github.url {value}
#

GIT_GITHUB_URL=$(git config --get remote.github.url)
GIT_COMMIT_SHORT_ID=$(git rev-parse --short HEAD)
GIT_COMMIT_MSG=$(git show $GIT_COMMIT_SHORT_ID --oneline -s --pretty=%B)

# Create Note to link to
git notes add -m "$GIT_GITHUB_URL$GIT_COMMIT_SHORT_ID" $GIT_COMMIT_SHORT_ID
