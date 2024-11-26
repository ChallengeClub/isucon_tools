# isucon_tools  

# 目的
本リポジトリはISUCON EC2インスタンス上に`$git clone`して使用します。

# shell scripts
|ファイル名|概要|
----|----
|01-09|**ssh,bash,git設定関連**|
|01_createUser.sh |ユーザ作成、sudo権限追加、sudo password省略|
|02_installPubkey.sh|ユーザのホームに秘密鍵書き込み|
|03_createUsers.sh|ユーザー名 パスワード フルネームのリストのtxtから全員分を設定| 
|04_setupSSH.sh|ssh keepaliveでタイムアウト抑止、sshパスワードログイン禁止|
|05_add_webapp_to_github.sh|webappのgithubへの登録|
|06_add_webapp_to_github_gitpull.sh||
|07_add_github_keys.sh|githubのユーザからssh公開鍵を取得してisuconユーザに設定|
|10-19|**bench,monitor関連**|
|10_install_packages.sh|aptパッケージのインストール|
|11_nginx_log_setup.sh|nginxのログのjson化スクリプト|
|20-29|**APP CI/CD関連**|
|30-39|**RDB関連**|

## 01_createUser.sh

```bash
# ユーザ作成、sudo権限追加、sudo password省略
$ ./01_createUser.sh $USER $PASSWORD $FULLNAME
```

## 02_installPubkey.sh
```bash
# ユーザのホームに秘密鍵書き込み
$ ./02_installPubkey.sh $USER
```

## 03_createUsers.sh
```bash
# ユーザー名 パスワード フルネームのリストのtxtから全員分を設定
$ ./03_createUsers.sh  
```
ToDo: リストtxtのパラメタ指定
## 04_setupSSH.sh
```bash
# ssh keepaliveでタイムアウト抑止、sshパスワードログイン禁止
$ ./04_setupSSH.sh 
```

## 05_add_webapp_to_github.sh
```bash
# webappの中身をgit登録してリモートのgithubリポジトリにプッシュします。
# リモートリポジトリなど設定の中身を書き換えてつかってください。
$ ./05_add_webapp_to_github.sh  
```

## 06_add_webapp_to_github_gitpull.sh
```bash
# webappの中身をgit登録してリモートのgithubリポジトリにプッシュします。
# リモートリポジトリなど設定の中身を書き換えてつかってください。
# 05_add_webapp_to_github.shの改良販。空initialコミットがあったり、git pullがうまくいかないときの対策もあったり。
$ ./06_add_webapp_to_github_gitpull.sh
```

## 07_add_github_keys.sh
```bash
# 指定したGitHubユーザーの公開SSH鍵をGitHubから取得して、isuconの~/.ssh/authorized_keysに追加します。
$ ./07_add_github_keys.sh user1 user2 user3 
```

## 11_nginx_log_setup.sh
```bash
# nginxのログのjson化スクリプト。未動作テスト。
$ ./11_nginx_log_setup.sh
```

# snipets
まずは各ユーザのファイルで管理して、共通でよく使いそうなものを共有しましょう  
(isucon_tipsに作成しても良いかもです)  
