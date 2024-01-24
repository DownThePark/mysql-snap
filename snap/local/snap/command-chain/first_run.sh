#!/bin/bash

#
# Initialize contents for $SNAP_COMMON
#
if [ ! -d $SNAP_COMMON/data ] ; then
  mkdir $SNAP_COMMON/data
fi

#
# Initialize contents for $SNAP_DATA
#
if [ ! -d $SNAP_DATA/etc ] ; then
  mkdir $SNAP_DATA/etc
fi

if [ ! -d $SNAP_DATA/log ] ; then
  mkdir $SNAP_DATA/log
fi

if [ ! -d $SNAP_DATA/run ] ; then
  mkdir $SNAP_DATA/run
fi

if [ -z "$(ls -A $SNAP_DATA/etc)" ] ; then
  cp $SNAP/etc/mysql.cnf $SNAP_DATA/etc/
  cp $SNAP/etc/mysqld.cnf $SNAP_DATA/etc/
fi
