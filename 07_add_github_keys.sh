#!/bin/bash

# 引数が少なくとも1つ以上渡されているかチェック
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <github_user1> <github_user2> ... <github_userN>"
    exit 1
fi

# 対象ユーザーのauthorized_keysファイルのパス
TARGET_USER="isucon"  # EC2インスタンスのユーザー名を指定 (デフォルトはisucon)
AUTHORIZED_KEYS_FILE="/home/$TARGET_USER/.ssh/authorized_keys"

# authorized_keysファイルの存在を確認し、なければ作成する
if [ ! -f "$AUTHORIZED_KEYS_FILE" ];then
    echo "Creating $AUTHORIZED_KEYS_FILE"
    mkdir -p "/home/$TARGET_USER/.ssh"
    touch "$AUTHORIZED_KEYS_FILE"
    chmod 600 "$AUTHORIZED_KEYS_FILE"
    chown "$TARGET_USER":"$TARGET_USER" "$AUTHORIZED_KEYS_FILE"
fi

# 引数に与えられたGitHubユーザー名を順番に処理
for user in "$@"; do
    echo "Fetching SSH keys for GitHub user: $user"
    # GitHubの公開鍵APIエンドポイントから鍵を取得
    keys=$(curl -s "https://github.com/$user.keys")

    # 鍵が存在するかチェックし、authorized_keysに追加
    if [ -n "$keys" ]; then
        echo "Adding keys for $user to $AUTHORIZED_KEYS_FILE"
        echo "# Keys for GitHub user $user" >> "$AUTHORIZED_KEYS_FILE"
        echo "$keys" >> "$AUTHORIZED_KEYS_FILE"
    else
        echo "No keys found for $user on GitHub"
    fi
done

# ファイルのパーミッションを設定
chmod 600 "$AUTHORIZED_KEYS_FILE"
chown "$TARGET_USER":"$TARGET_USER" "$AUTHORIZED_KEYS_FILE"

echo "All keys have been added to $AUTHORIZED_KEYS_FILE"
