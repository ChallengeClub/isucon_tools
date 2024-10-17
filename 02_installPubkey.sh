#!/bin/bash

# ユーザー名を入力
USERNAME=$1

# ユーザーにSSH公開鍵を設定
if [ -f "./pubkeys/$USERNAME.pub" ]; then
    # SSH公開鍵を追加
    sudo mkdir -p /home/$USERNAME/.ssh
    sudo cp ./$USERNAME.pub /home/$USERNAME/.ssh/authorized_keys
    sudo chown $USERNAME:$USERNAME /home/$USERNAME/.ssh -R
    sudo chmod 700 /home/$USERNAME/.ssh
    sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys

    # SSHサービスを再起動
    sudo service ssh restart

    echo "SSH公開鍵が設定されました。"
else
    echo "SSH公開鍵ファイル ./$USERNAME.pub が見つかりません。カレントディレクトリに存在することを確認してください。"
fi
