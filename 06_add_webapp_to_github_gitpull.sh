#!/bin/sh
# webapp上をgit管理対象にする前提です

# gitconfig 適宜変更してください
git config --global user.email "kiwasa28+isucon@gmail.com"
git config --global user.name "isucon"
git config --global init.defaultBranch main
git config --global credential.helper 'cache --timeout=2592000'

cd ~/webapp
git init

# アカウント名, アクセストークン、URLは書き換えてください
# git remote add origin https://kiws-isucon-bot:{アクセストークン}@github.com/kiws-isucon-bot/isucon13_f1.git
# git remote add origin https://kiws-isucon-bot:{アクセストークン}@github.com/kiws-isucon-bot/isucon13_f2.git

git pull origin main

# webapp を追加してpushします
git add *
git status
git commit -m "add webapp first"

git push -u origin main
