#!/bin/bash

# usage
if ! test $# -ge 5 -a $# -le 6; then
	echo "usage: ${0} <user> <pass> <rep_owner> <rep> <add_team> <team_permission(pull or def=push or admin)>"
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

# Setting: Collaborators & teams: ÇÃê›íË (teamí«â¡)
GITHUB_SETTING_ADD_COLLABO_TEAM="${5:?}"
GITHUB_SETTING_ADD_COLLABO_TEAM_PERMISSION="${6:-push}" # pull or push or admin

GITHUB_SETTING_ADD_COLLABO_TEAM_ID=`curl -s -u "${GITHUB_USER}:${GITHUB_PASS}" -X GET ${GITHUB_API}/orgs/${GITHUB_SETTING_REP_OWNER}/teams | grep id|cut -d":" -f2|tr -d " "|tr -d ","`
echo "${GITHUB_SETTIN_ADD_COLLABO_TEAM_ID}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X PUT -d "{\"permission\": \"${GITHUB_SETTING_ADD_COLLABO_TEAM_PERMISSION}\"}" ${GITHUB_API}/teams/${GITHUB_SETTING_ADD_COLLABO_TEAM_ID}/repos/${GITHUB_SETTING_REP_OWNER}/${GITHUB_SETTING_REP}

