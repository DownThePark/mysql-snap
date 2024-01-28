#!/bin/bash

# Start MySQL server
gosu snap_daemon $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf
