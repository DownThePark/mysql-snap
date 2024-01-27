#!/bin/bash

# Initialize contents for $SNAP_DATA
init_snap_data() {
  if [ ! -d $SNAP_DATA/etc ] ; then
    mkdir $SNAP_DATA/etc
  fi

  if [ ! -d $SNAP_DATA/log ] ; then
    mkdir $SNAP_DATA/log
    touch $SNAP_DATA/log/mysql.log
    touch $SNAP_DATA/log/mysql_error.log
  fi

  if [ ! -d $SNAP_DATA/run ] ; then
    mkdir $SNAP_DATA/run
  fi

  if [ -z "$(ls -A $SNAP_DATA/etc)" ] ; then
    cp $SNAP/etc/mysql.cnf $SNAP_DATA/etc/
    cp $SNAP/etc/mysqld.cnf $SNAP_DATA/etc/
  fi

  chown -R _daemon_:root $SNAP_DATA
  chmod 660 $SNAP_DATA/log/mysql.log
  chmod 660 $SNAP_DATA/log/mysql_error.log
}

# Initialize contents for $SNAP_COMMON
init_snap_common() {
  if [ ! -d $SNAP_COMMON/data ] ; then
    mkdir $SNAP_COMMON/data
  fi

  chown -R _daemon_:root: $SNAP_COMMON/data
}

# Initialize MySQL data directory
init_mysql_data() {
  if [ -z $(ls -A $SNAP_COMMON/data) ] ; then
    $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize --console
    chmod -R 700 $SNAP_COMMON/data
    if [ ! -f $SNAP_COMMON/data/mysql.ibd ] ; then
      echo "Error: MySQL was unable to initialize the data directory at $SNAP_COMMON/data"
      exit 1
    fi
  fi
}

init_snap_data
init_snap_common
init_mysql_data
