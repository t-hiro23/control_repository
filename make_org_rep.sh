#!/bin/bash

# ��ƃ��[�U(admin)
GITHUB_USER="t-hiro23"
GITHUB_PASS="${1:?}"

# ���|�W�g��������
DST_ORG="t-hiro23-fork" 
DST_REP="hogehoge" #New repository Name
DST_REP_CLONE_URL="https://${GITHUB_USER}:${GITHUB_PASS}@github.com/${DST_ORG}/${DST_REP}.git"

# ���|�W�g���̃x�[�X�ɂ������
BASE_REP_CLONE_URL="https://${GITHUB_USER}:${GITHUB_PASS}@github.com/t-hiro23/push"
BASE_REP_WEB_URL="https://github.com/t-hiro23/push"
BASE_REP_COPY_DIR="./push"

# �`�[�� & ���[�U�w��
COLLABO_TEAM_LIST=("team1")
COLLABO_USER_LIST=("t-hiro23")

# �u�����`�w��
DEFAULT_BRANCH="apps_dev"
PROTECTED_BRANCH_LIST=("master" "develop" "apps_dev")



# organization�ɐV�K���|�W�g���쐬
./create/make_rep_of_org.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP}



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



# �������|�W�g���\���\�z
mkdir tmp
cd tmp
  # �x�[�X�ɂȂ郊�|�W�g���ł̍��
  git clone ${BASE_REP_CLONE_URL}
  cd ${BASE_REP_CLONE_URL##*/}
    BASE_REP_HEAD_HASH=`git log --pretty=format:"%H"|head -1`
  cd ..

  # �V������������|�W�g���Ńu�����`�쐬
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



# �u�����`�I�v�V�����ݒ�
./edit/set_default_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${DEFAULT_BRANCH}

for PROTECTED_BRANCH in ${PROTECTED_BRANCH_LIST[@]}
do
	./edit/set_protected_branch.sh ${GITHUB_USER} ${GITHUB_PASS} ${DST_ORG} ${DST_REP} ${PROTECTED_BRANCH}
done
