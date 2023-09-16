# isucon_tools  

```bash
# ユーザ作成、sudo権限追加、sudo password省略
$ ./01_createUser.sh ユーザー名 パスワード フルネーム
# 各ユーザのホームに秘密鍵書き込み
$ ./02_installPubkey.sh ユーザー名
# ユーザー名 パスワード フルネームのリストのtxtから全員分を設定
$ ./03_createUsers.sh  
# ssh keepaliveでタイムアウト抑止、sshパスワードログイン禁止
$ ./04_setupSSH.sh 
```
