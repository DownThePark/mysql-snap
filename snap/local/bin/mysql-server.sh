#!/bin/bash

# Start MySQL server
$SNAP/bin/setpriv.sh $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf
