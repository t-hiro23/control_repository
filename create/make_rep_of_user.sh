#!/bin/bash

# usage
if test $# -ne 3; then
	echo "usage: ${0} <user> <pass> <new_rep>"
	exit 0
fi


#共通設定を読み込む
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# 基本設定
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# userの新しいリポジトリを作成
GITHUB_NEW_REP="${3:?}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X POST -d "{\"name\":\"${GITHUB_NEW_REP}\"}" ${GITHUB_API}/user/repos
