#!/bin/bash

FILE=/ssh/key
if [ -f "$FILE" ]; then
  mkdir ~/.ssh/
  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
  cp /ssh/key ~/.ssh/id_rsa
  chmod 0600 ~/.ssh/id_rsa
fi

if [[ -z "${GIT_BRANCH}" ]]; then
    git ls-remote $GIT_REPO $GIT_BRANCH |  awk '{ print $1}'
else
    git ls-remote $GIT_REPO head |  awk '{ print $1}'
fi
