#!/bin/bash

# usage
if test $# -ne 4; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep>"
	exit 0
fi


#ã§í ê›íËÇì«Ç›çûÇﬁ
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# äÓñ{ê›íË
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# Setting: ã§í 
GITHUB_SETTING_REP_OWNER="${3:?}"
GITHUB_SETTING_REP="${4:?}"


# Setting: Options: ÇÃê›íË
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X PATCH -d "{\"name\":\"${GITHUB_SETTING_REP}\", \"has_issues\":true, \"has_projects\":false, \"allow_merge_commit\":false, \"allow_rebase_merge\":false}" ${GITHUB_API}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}
