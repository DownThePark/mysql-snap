#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then echo "Error! Please re-run this script as root." >&2; exit 1; fi

echo ""
cat $SNAP_DATA/log/error.log | grep -o "A temporary password is generated for root@localhost:.*"
echo -e "
--- Important Note ---
MySQL will prevent itself from being used until you change this password. You can use
the following commands to do so (don't forget to change YOUR_NEW_PASS with a strong password):

- _NAME_.mysql -u root -p
- ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';
"
