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

  if [ $(find $SNAP_DATA/etc -maxdepth 0 -printf '%u\n') == 'root' ] ; then
    chown -R snap_daemon:root $SNAP_DATA/etc
    chown -R snap_daemon:root $SNAP_DATA/log
    chown -R snap_daemon:root $SNAP_DATA/run
  fi
}

# Initialize contents for $SNAP_COMMON
init_snap_common() {
  if [ ! -d $SNAP_COMMON/data ] ; then
    mkdir $SNAP_COMMON/data
  fi

  if [ $(find $SNAP_COMMON/data -maxdepth 0 -printf '%u\n') == 'root' ] ; then
    chown snap_daemon:root $SNAP_COMMON/data
  fi
}

# Initialize MySQL data directory
init_mysql_data() {
  if [ -z $(ls -A $SNAP_COMMON/data) ] ; then
    $SNAP/bin/setpriv.sh $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize --console
    if [ ! -f $SNAP_COMMON/data/mysql.ibd ] ; then
      echo "Error: MySQL was unable to initialize the data directory at $SNAP_COMMON/data"
      exit 1
    fi
  fi

  $SNAP/bin/setpriv.sh chmod 770 $SNAP_COMMON/data
}

init_snap_data
init_snap_common
init_mysql_data
