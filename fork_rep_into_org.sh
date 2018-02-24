#!/bin/bash

# ��ƃ��[�U(admin)
GITHUB_USER="t-hiro23"
GITHUB_PASS=""

# fork���̃��|�W�g��
SRC_REP_OWNER="t-hiro23"
SRC_REP="push"

# fork�����
DST_ORG="t-hiro23-fork"
DST_REP="${SRC_REP}"

# �u�����`�w��
DEFAULT_BRANCH="10"
PROTECTED_BRANCH_LIST=("master" "10" "100")

# �`�[�� & ���[�U�w��
COLLABO_TEAM_LIST=("team1")
COLLABO_USER_LIST=("t-hiro23")



# organization�Ƀ��|�W�g����fork����
./create/fork_into_organization.sh ${GITHUB_USER} ${GITHUB_PASS} ${SRC_REP_OWNER} ${SRC_REP} ${DST_ORG}



# ���|�W�g���I�v�V�����ݒ�
./edit/set_options.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP}

for COLLABO_TEAM in ${COLLABO_TEAM_LIST[@]}
do
	./edit/set_team.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${COLLABO_TEAM}
done



for COLLABO_USER in ${COLLABO_USER_LIST[@]}
do
	./edit/set_user.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${COLLABO_USER}
done



# �u�����`�I�v�V�����ݒ�
./edit/set_default_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${DEFAULT_BRANCH}

for PROTECTED_BRANCH in ${PROTECTED_BRANCH_LIST[@]}
do
	./edit/set_protected_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${PROTECTED_BRANCH}
done
