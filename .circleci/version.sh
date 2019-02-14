#!/bin/bash

COMMIT_TAG="$(git tag -l --points-at HEAD 2>/dev/null)"
BRANCH_TAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
REPO_TAG="$(git describe --tags $(git rev-list --tags --max-count=1 2>/dev/null) 2>/dev/null)"
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

if [[ -z "$COMMIT_TAG" ]]; then
    COMMIT_TAG="null"
fi
if [[ -z "$BRANCH_TAG" ]]; then
    BRANCH_TAG="null"
fi
if [[ -z "$REPO_TAG" ]]; then
    REPO_TAG="null"
fi
if [[ -z "$CURRENT_BRANCH" ]]; then
    CURRENT_BRANCH="master"
fi

python ~/scripts/version.py $COMMIT_TAG $BRANCH_TAG $REPO_TAG $CURRENT_BRANCH
