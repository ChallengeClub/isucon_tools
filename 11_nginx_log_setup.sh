#!/bin/bash

# Nginxの状態を確認
echo "Checking Nginx status..."
sudo systemctl status nginx

# NginxのログフォーマットをJSONに変更
echo "Modifying Nginx log format to JSON..."
sudo sed -i '/access_log/s|access.log;|access.log json;|' /etc/nginx/nginx.conf

# Nginx設定ファイルの検証
echo "Testing Nginx configuration..."
sudo nginx -t
if [ $? -ne 0 ]; then
    echo "Nginx configuration test failed. Exiting."
    exit 1
fi

# Nginxの設定をリロード
echo "Reloading Nginx..."
sudo systemctl reload nginx

# 手動でログファイルのローテートを実行
echo "Rotating log files..."
sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.old
sudo /usr/sbin/nginx -s reopen

# 新しいログファイルの内容を表示
echo "Displaying new log entries..."
sudo tail -n 10 /var/log/nginx/access.log
