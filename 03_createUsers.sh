#!/bin/bash

# ファイルからユーザー情報を読み取り、各行を処理
while IFS= read -r line; do
    # 各行をスペースで分割して変数に格納
    read -ra user_info <<< "$line"
    
    # ユーザー名、パスワード、フルネームを抽出
    username="${user_info[0]}"
    password="${user_info[1]}"
    fullname="${user_info[2]}"
    
    # createUser.sh を呼び出し、ユーザーを作成
    ./01_createUser.sh "$username" "$password" "$fullname"
    ./02_installPubkey.sh "$username"

done < user_info.txt
