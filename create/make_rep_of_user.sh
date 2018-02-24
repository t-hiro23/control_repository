#!/bin/bash

# usage
if test $# -ne 3; then
	echo "usage: ${0} <user> <pass> <new_rep>"
	exit 0
fi


# ��{�ݒ�
GITHUB_API="https://api.github.com"
GITHUB_USER=${1:?}
GITHUB_PASS=${2:?}


# user�̐V�������|�W�g�����쐬
GITHUB_NEW_REP="${3:?}"
curl -u "${GITHUB_USER}:${GITHUB_PASS}" -X POST -d "{\"name\":\"${GITHUB_NEW_REP}\"}" ${GITHUB_API}/user/repos
