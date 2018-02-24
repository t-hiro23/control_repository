#!/bin/bash

# usage
if test $# -ne 5; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep> <protected_branch>"
	exit 0
fi


#���ʐݒ��ǂݍ���
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# ��{�ݒ�
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# Setting: ����
GITHUB_SETTING_REP_OWNER="${3:?}"
GITHUB_SETTING_REP="${4:?}"


# Setting: Branches: Protected branches�̐ݒ�
GITHUB_SETTING_PROTECTED_BRANCH="${5:?}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X PUT -d '{"required_pull_request_reviews": {"dismiss_stale_reviews":true,"require_code_owner_reviews":false}, "required_status_checks": {"strict":true,"contexts":[]}, "restrictions":null, "enforce_admins":null}' ${GITHUB_API}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}/branches/${GITHUB_SETTING_PROTECTED_BRANCH}/protection
