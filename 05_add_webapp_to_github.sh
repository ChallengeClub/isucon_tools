#!/bin/sh
git config --global user.email "kiwasa28+isucon@gmail.com"
git config --global user.name "isucon"
git config --global init.defaultBranch main
git config --global credential.helper 'cache --timeout=2592000'

cd ~/webapp
git init
git add *
git status
git commit -m "first commit"

git remote add origin https://github.com/ChallengeClub/isucon12q3.git
git push -u origin main
