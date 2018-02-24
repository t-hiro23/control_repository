#!/bin/bash

# 作業ユーザ(admin)
GITHUB_USER="t-hiro23"
GITHUB_PASS="${1:?}"

# リポジトリを作る先
DST_ORG="t-hiro23-fork" 
DST_REP="hogehoge" #New repository Name
DST_REP_CLONE_URL="https://${GITHUB_USER}:${GITHUB_PASS}@github.com/${DST_ORG}/${DST_REP}.git"

# リポジトリのベースにするもの
BASE_REP_CLONE_URL="https://${GITHUB_USER}:${GITHUB_PASS}@github.com/t-hiro23/push"
BASE_REP_WEB_URL="https://github.com/t-hiro23/push"
BASE_REP_COPY_DIR="./push"

# チーム & ユーザ指定
COLLABO_TEAM_LIST=("team1")
COLLABO_USER_LIST=("t-hiro23")

# ブランチ指定
DEFAULT_BRANCH="apps_dev"
PROTECTED_BRANCH_LIST=("master" "develop" "apps_dev")



# organizationに新規リポジトリ作成
./create/make_rep_of_org.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP}



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



# 初期リポジトリ構成構築
mkdir tmp
cd tmp
  # ベースになるリポジトリでの作業
  git clone ${BASE_REP_CLONE_URL}
  cd ${BASE_REP_CLONE_URL##*/}
    BASE_REP_HEAD_HASH=`git log --pretty=format:"%H"|head -1`
  cd ..

  # 新しく作ったリポジトリでブランチ作成
  git clone ${DST_REP_CLONE_URL}
  cp -rp ${BASE_REP_COPY_DIR}/* ${DST_REP}
  cd ${DST_REP}
    git add -A
    git commit -m "Init this repository." -m "" -m "based on ${BASE_REP_WEB_URL}/commit/${BASE_REP_HEAD_HASH}"
    git push -u origin
    
    git checkout -b develop master
    git push origin develop
    
    git checkout -b apps_dev develop
    git push origin apps_dev
  cd ..
cd ..
rm -rf tmp



# ブランチオプション設定
./edit/set_default_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${DEFAULT_BRANCH}

for PROTECTED_BRANCH in ${PROTECTED_BRANCH_LIST[@]}
do
	./edit/set_protected_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${PROTECTED_BRANCH}
done
