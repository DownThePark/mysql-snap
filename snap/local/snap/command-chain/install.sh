#!/bin/bash

# Initialize contents for $SNAP_DATA
init_snap_data() {
  # Configuration
  mkdir $SNAP_DATA/etc
  cp $SNAP/etc/mysqld.cnf $SNAP_DATA/etc
  chown -R snap_daemon:root $SNAP_DATA/etc

  # Logs
  mkdir $SNAP_DATA/log
  touch $SNAP_DATA/log/error.log
  touch $SNAP_DATA/log/query.log
  touch $SNAP_DATA/log/mysql-bin.log
  touch $SNAP_DATA/log/mysql-slow.log
  chmod -R o-rwx $SNAP_DATA/log
  chown -R snap_daemon:root $SNAP_DATA/log

  # Sockets
  mkdir $SNAP_DATA/run
  chown -R snap_daemon:root $SNAP_DATA/run
}

# Initialize contents for $SNAP_COMMON
init_snap_common() {
  # Create directory for storing data and set permissions
  mkdir $SNAP_COMMON/data
  chown snap_daemon:root $SNAP_COMMON/data

  # Initialize data directory
  $SNAP/bin/setpriv.sh $SNAP/usr/bin/mysqld --defaults-file=$SNAP/etc/my.cnf --initialize-insecure

  # Throw error if data directory not initialized
  if [ ! -f $SNAP_COMMON/data/mysql.ibd ] ; then
    echo "Error: MySQL was unable to initialize the data directory at $SNAP_COMMON/data"
    exit 1
  fi

  # Remove "group" and "other" permission access from data directory
  chmod go-rwx $SNAP_COMMON/data
}

# Enable auth socket plugin
enable_auth_socket() {
  local init_file="$(mktemp)"
  echo "INSTALL PLUGIN auth_socket SONAME 'auth_socket.so';" >> "$init_file"
  echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'auth_socket';" >> "$init_file"
  echo "SHUTDOWN;" >> "$init_file"
  chown snap_daemon:root "$init_file"
  $SNAP/bin/setpriv.sh $SNAP/usr/bin/mysqld --user=snap_daemon --skip-networking --skip-mysqlx --init-file="$init_file"
}

init_snap_data
init_snap_common
enable_auth_socket
