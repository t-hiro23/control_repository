#!/bin/bash

# usage
if ! test $# -ge 5 -a $# -le 6; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep> <add_user> <user_permission(pull or push or def=admin)>"
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

# Setting: Collaborators & teams: の設定 (team追加)
GITHUB_SETTING_ADD_COLLABO_USER="${5-}"
GITHUB_SETTING_ADD_COLLABO_USER_PERMISSION="${6:-admin}" # pull or push or admin


curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X PUT -d "{\"permission\":\"${GITHUB_SETTING_ADD_COLLABO_USER_PERMISSION}\"}" ${GITHUB_API}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}/collaborators/${GITHUB_SETTING_ADD_COLLABO_USER}

