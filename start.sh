#!/bin/bash

FILE=/ssh/key
if test -f "$FILE"; then
    echo "$FILE exists."
fi

mkdir ~/.ssh/
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
cp /ssh/key ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa


if [[ -z "${GIT_BRANCH}" ]]; then
    git ls-remote $GIT_REPO $GIT_BRANCH
else
    git ls-remote $GIT_REPO head
fi
