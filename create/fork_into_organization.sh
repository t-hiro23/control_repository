#!/bin/bash

# usage
if test $# -ne 5; then
	echo "usage: ${0} <user> <pass> <src_rep_owner> <src_rep> <dst_organization>"
	exit 0
fi


#ã§í ê›íËÇì«Ç›çûÇﬁ
TOOL_ROOT_DIR=`which ${0}`
. ${TOOL_ROOT_DIR%/*/*}/.setting/setting.sh


# äÓñ{ê›íË
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# organizationÇ÷fork
GITHUB_SRC_REP_OWNER="${3:?}"
GITHUB_SRC_REP="${4:?}"
GITHUB_DST_ORGANIZATION="${5:?}"

curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X POST -d "{\"organization\": \"${GITHUB_DST_ORGANIZATION}\"}" ${GITHUB_API}/repos/${GITHUB_SRC_REP_OWNER}/${GITHUB_SRC_REP}/forks
