#!/bin/bash

BUILD_NUMBER=${CIRCLE_BUILD_NUM:-'0'}
BRANCH=${CIRCLE_BRANCH:-'master'}

# If this is a tagged build, the tag is build name, build number is 0
if ![[ -z "$CIRCLE_TAG" ]]; then
    echo $CIRCLE_TAG
fi

LASTEST_TAG="$(git rev-list --tags --max-count=1)"
echo $LASTEST_TAG

# if branch master and not pr -> return blah-beta-buildnumber
# else return blah-pr-prnumber-buildnumber
if ![[ -z "$CIRCLE_BRANCH" ]] && ![[ -z "$CIRCLE_PR_NUMBER" ]]; then
    echo $LASTEST_TAG-beta
else
    echo $LASTEST_TAG-pr-$CIRCLE_PR_NUMBER
fi
