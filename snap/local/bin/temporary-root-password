#!/bin/bash

echo ""
cat $SNAP_DATA/log/error.log | grep -o "A temporary password is generated for root@localhost:.*"
echo ""
echo "--- IMPORTANT ---"
echo "This password is stored in plaintext on your filesystem. Therefore, it is"
echo "paramount that you change it immediately! You can do so using the following"
echo "commands (replace 'YOUR_PASS' with a strong password):"
echo ""
echo "- mysql-strict.mysql -u root -p"
echo "- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_PASS';"
echo "- exit"
echo "----------------"
