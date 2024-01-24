#!/bin/bash

export DATA_DIR=$SNAP_COMMON/data

#
# Initialize MySQL
#
if [ -z "$(ls -A $DATA_DIR)" ] ; then
  echo "Initializing MySQL data directory..."
  $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize --console
  chmod -R 700 $DATA_DIR
fi

#
# Start MySQL
#
$SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf
