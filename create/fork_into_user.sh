#!/bin/bash


# usage
if test $# -ne 4; then
	echo "usage: ${0} <user> <pass> <fork_target_rep_owner> <fork_target_rep>"
	exit 0
fi


#共通設定を読み込む
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# 基本設定
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# userへfork
GITHUB_SRC_REP_OWNER="${3:?}"
GITHUB_SRC_REP="${4:?}"

curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X POST ${GITHUB_API}/repos/${GITHUB_SRC_REP_OWNER}/${GITHUB_SRC_REP}/forks
