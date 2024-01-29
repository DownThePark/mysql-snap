#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then echo "Error! Please re-run this script as root." >&2; exit 1; fi

echo ""
cat $SNAP_DATA/log/error.log | grep -o "A temporary password is generated for root@localhost:.*"
echo "
--- IMPORTANT ---
This password is stored in plaintext on your filesystem. Therefore, it is
paramount that you change it immediately! You can do so using the following
commands (replace YOUR_NEW_PASS with a strong password):

- mysql-strict.mysql -u root -p
- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';
- exit
"
