#!/bin/bash


# usage
if test $# -ne 4; then
	echo "usage: ${0} <user> <pass> <into_org> <new_rep>"
	exit 0
fi


# 基本設定
GITHUB_API="https://api.github.com"
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# organizationの新しいリポジトリを作成
GITHUB_ORGANIZATION="${3:?}"
GITHUB_NEW_REP="${4:?}"

curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X POST -d "{\"name\":\"${GITHUB_NEW_REP}\"}" ${GITHUB_API}/orgs/${GITHUB_ORGANIZATION}/repos
