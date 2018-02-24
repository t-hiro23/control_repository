#!/bin/bash

# usage
if test $# -ne 5; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep> <default_branch>"
	exit 0
fi


# 基本設定
GITHUB_API="https://api.github.com"
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# Setting: 共通
GITHUB_SETTING_REP_OWNER="${3:?}"
GITHUB_SETTING_REP="${4:?}"


# Setting: Branches: Default branchの設定
GITHUB_SETTING_DEFAULT_BRANCH="${5:?}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X PATCH -d "{\"name\":\"${GITHUB_SETTING_REP}\", \"default_branch\":\"${GITHUB_SETTING_DEFAULT_BRANCH}\"}" ${GITHUB_API}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}
