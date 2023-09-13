#!/bin/bash

# 新しいClientAliveIntervalの値
NEW_INTERVAL="30"

# sshd_config ファイルのパス
SSH_SERVER_CONFIG_FILE="/etc/ssh/sshd_config"

# 新しいClientAliveIntervalの設定を追加または変更
sudo sed -i "s/^#*\s*ClientAliveInterval.*/ClientAliveInterval $NEW_INTERVAL/" $SSH_SERVER_CONFIG_FILE
echo "ClientAliveInterval を $NEW_INTERVAL 秒に設定しました。"

# SSHサービス設定を変更してパスワードログインを無効化
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' $SSH_SERVER_CONFIG_FILE
echo "パスワードによるSSHログインが無効化されました。"

# SSHサービスを再起動して変更を有効にする
sudo service ssh restart

