#!/usr/bin/python2

import os
import re
import sys
import semver

def isValidSemVer(tag):
    if not tag:
        return 0
    else:
        # RegEx taken from https://github.com/semver/semver/issues/232#issue-48635632
        regex = '^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*)?(\+[0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*)?$'
        return re.match(regex, tag)

def getBuildNum():
    if os.getenv('CIRCLE_BUILD_NUM'):
        return os.environ['CIRCLE_BUILD_NUM']
    else:
        return '0'

def getBranchName():
    if os.getenv('CIRCLE_BRANCH'):
        return os.environ['CIRCLE_BRANCH']
    else:
        return sys.argv[4]

def getPRNum():
    if os.getenv('CIRCLE_PR_NUMBER'):
        return os.environ['CIRCLE_PR_NUMBER']
    else:
        return '0'


def isPR():
    return os.getenv('CIRCLE_PR_NUMBER')


def getLatestTaggedBranch(branch, repo):
    brnch = branch
    rpo = repo

    # Check at least one commit has been tagged
    if not isValidSemVer(branch):
        brnch = '0.0.0'
    if not isValidSemVer(repo):
        rpo = '0.0.0'

    # Check if our branch has the latest tag
    if semver.compare(brnch, rpo) == -1:
        return semver.bump_patch(brnch)
    else:
        return semver.bump_minor(brnch)

def getSuffix(currentBranch):
    if currentBranch == 'master' and not isPR():
        return '-beta-' + build
    else:
        pr = getPRNum()
        return '-PR' + pr + '-' + build

###############################################

build = getBuildNum()
currentBranch = getBranchName()

# Get current commit tag
commitTag = sys.argv[1][1:]

if isValidSemVer(commitTag):
    print(commitTag)
else:
    # Get latest branch and repo tags
    branchTag = sys.argv[2][1:]
    repoTag = sys.argv[3][1:]

    latestBranch = getLatestTaggedBranch(branchTag, repoTag)
    suffix = getSuffix(currentBranch)
    print(latestBranch + suffix)
