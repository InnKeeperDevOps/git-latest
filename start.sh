#!/bin/bash

FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi

mkdir ~/.ssh/
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
cp /ssh/key ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa

git clone $GIT_REPO .
if [[ -z "${GIT_BRANCH}" ]]; then
    git checkout $GIT_BRANCH
fi

git log -1 --pretty="hash:%H, author:%an, date:%ct"

