#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then echo "Error! Please re-run this script as root." >&2; exit 1; fi

echo ""
cat $SNAP_DATA/log/error.log | grep -o "A temporary password is generated for root@localhost:.*"
echo -e "
MySQL will prevent itself from being used until you change this password.
To update it, start by logging to the MySQL server:

  mysql-strict.mysql -u root -p

Afterwards, execute the following SQL statement (replace YOUR_NEW_PASS below
with a strong password):

  ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';
"
