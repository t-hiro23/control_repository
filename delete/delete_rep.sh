#!/bin/bash

# usage
if test $# -ne 4; then
	echo "usage: ${0} <user> <pass> <rep_owner> <delete_target_rep>"
	exit 0
fi

# 基本設定
GITHUB_API="https://api.github.com"
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# リポジトリ削除
GITHUB_DEL_REP_OWNER="${3:?}"
GITHUB_DEL_REP="${4:?}"

curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X DELETE ${GITHUB_API}/repos/${GITHUB_DEL_REP_OWNER}/${GITHUB_DEL_REP}


