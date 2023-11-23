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

# アカウント名, アクセストークン、URLは書き換えてください
# git remote add origin https://{Githubアカウント名}:{アクセストークン}@github.com/kiws-isucon-bot/isucon13_f1.git
# git remote add origin https://{Githubアカウント名}:{アクセストークン}@github.com/kiws-isucon-bot/isucon13_f2.git
# git remote add origin https://github.com/ChallengeClub/isucon12q3.git
git push -u origin main
