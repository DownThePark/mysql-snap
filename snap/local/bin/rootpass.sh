#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then echo "Error! Please re-run this script as root." >&2; exit 1; fi

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

echo ""
cat $SNAP_DATA/log/error.log | grep -o "A temporary password is generated for root@localhost:.*"
echo -e "
--- Note ---
MySQL will prevent you from using the MySQL server until you change this password.
To do so, you can use the following two commands (don't forget to change YOUR_NEW_PASS
with a strong password):

${GREEN}$ ${NOCOLOR}_NAME_.mysql -u root -p
${GREEN}mysql> ${NOCOLOR}ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';
"
