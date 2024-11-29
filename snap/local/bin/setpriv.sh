#!/bin/bash

$SNAP/bin/setpriv --clear-groups --reuid snap_daemon --regid root -- $@
