#!/bin/bash

# usage
if test $# -ne 5; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep> <unprotected_branch>"
	exit 0
fi


#共通設定を読み込む
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# 基本設定
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# Setting: 共通
GITHUB_SETTING_REP_OWNER="${3:?}"
GITHUB_SETTING_REP="${4:?}"


# Setting: Branches: Protected branchesの解除
GITHUB_SETTING_PROTECTED_BRANCH="${5:?}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X DELETE ${GITHUB_API}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}/branches/${GITHUB_SETTING_PROTECTED_BRANCH}/protection
