#!/bin/bash

# Initialize contents for $SNAP_DATA
init_snap_data() {
  # Configuration
  mkdir $SNAP_DATA/etc
  cp $SNAP/etc/mysql.cnf $SNAP_DATA/etc
  cp $SNAP/etc/mysqld.cnf $SNAP_DATA/etc
  chown -R snap_daemon:root $SNAP_DATA/etc

  # Logs
  mkdir $SNAP_DATA/log
  touch $SNAP_DATA/log/mysql.log
  touch $SNAP_DATA/log/mysql_error.log
  chmod -R o-rwx $SNAP_DATA/log
  chown -R snap_daemon:root $SNAP_DATA/log

  # Sockets
  mkdir $SNAP_DATA/run
  chown -R snap_daemon:root $SNAP_DATA/run
}

# Initialize contents for $SNAP_COMMON
init_snap_common() {
  mkdir $SNAP_COMMON/data
  chown snap_daemon:root $SNAP_COMMON/data
  $SNAP/bin/setpriv.sh $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize --console
  if [ ! -f $SNAP_COMMON/data/mysql.ibd ] ; then
    echo "Error: MySQL was unable to initialize the data directory at $SNAP_COMMON/data"
    exit 1
  fi
  $SNAP/bin/setpriv.sh chmod -R go-rwx $SNAP_COMMON/data
}

init_snap_data
init_snap_common
