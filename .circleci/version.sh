#!/bin/bash

REPO_TAG="$(git describe --tags $(git rev-list --tags --max-count=1 2>/dev/null) 2>/dev/null)"
TAG=${CIRCLE_TAG:-$REPO_TAG}
BRANCH=${CIRCLE_BRANCH:-'master'}

# tagged version is the TAG
if [ ! -z "$CIRCLE_TAG" ]; then
    echo $CIRCLE_TAG
# master build without tag is a BETA
elif [ "$BRANCH" = "master" ] && [ -z "$CIRCLE_PR_NUMBER" ]; then
    echo $TAG-beta
# must be a PR build
else
    echo $TAG-pr
fi