#!/bin/bash

export DATA_DIR=$SNAP_COMMON/data

#
# Initialize MySQL
#
if [ -z $(ls -A $DATA_DIR) ] ; then
  echo "Initializing MySQL data directory at $SNAP_COMMON/data"
  $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize --console
  chmod -R 700 $DATA_DIR
  if [ -f $DATA_DIR/mysql.ibd ] ; then
    echo "Initialization complete!" ;
  else
    echo "Error: MySQL was unable to initialize the data directory!"
  fi
fi

#
# Start MySQL
#
$SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf
