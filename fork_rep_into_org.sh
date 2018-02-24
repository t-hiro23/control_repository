#!/bin/bash

# 作業ユーザ(admin)
GITHUB_USER="t-hiro23"
GITHUB_PASS=""

# fork元のリポジトリ
SRC_REP_OWNER="t-hiro23"
SRC_REP="push"

# forkする先
DST_ORG="t-hiro23-fork"
DST_REP="${SRC_REP}"

# ブランチ指定
DEFAULT_BRANCH="10"
PROTECTED_BRANCH_LIST=("master" "10" "100")

# チーム & ユーザ指定
COLLABO_TEAM_LIST=("team1")
COLLABO_USER_LIST=("t-hiro23")



# organizationにリポジトリをforkする
./create/fork_into_organization.sh ${GITHUB_USER} ${GITHUB_PASS} ${SRC_REP_OWNER} ${SRC_REP} ${DST_ORG}



# リポジトリオプション設定
./edit/set_options.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP}

for COLLABO_TEAM in ${COLLABO_TEAM_LIST[@]}
do
	./edit/set_team.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${COLLABO_TEAM}
done



for COLLABO_USER in ${COLLABO_USER_LIST[@]}
do
	./edit/set_user.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${COLLABO_USER}
done



# ブランチオプション設定
./edit/set_default_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${DEFAULT_BRANCH}

for PROTECTED_BRANCH in ${PROTECTED_BRANCH_LIST[@]}
do
	./edit/set_protected_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${PROTECTED_BRANCH}
done
