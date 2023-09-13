#!/bin/bash

# パラメータからユーザー名、パスワード、フルネームを取得
USERNAME=$1
PASSWORD=$2
FULLNAME=$3

# ユーザーを作成（パスワードも設定）
sudo useradd -m -p $(openssl passwd -1 $PASSWORD) -c "$FULLNAME" $USERNAME

# sudo権限を付与
sudo usermod -aG sudo $USERNAME

# sudo時のパスワード確認を省略
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME

echo "ユーザー $USERNAME が作成され、sudo権限とパスワード確認の省略が設定されました。"
