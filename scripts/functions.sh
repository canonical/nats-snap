#!/bin/sh
#
# Copyright 2021 Canonical Ltd.  All rights reserved.
#

# obtain nats.cfg from content share if nats-config is connected
getconfig(){
  if snapctl is-connected nats-config; then
    while [ ! -f $SNAP/external/share/nats.cfg ]; do
      sleep 1
    done
    if [ ! -d $SNAP_COMMON/server/ ]; then
      mkdir $SNAP_COMMON/server/
    fi
    cp $SNAP/external/share/nats.cfg $SNAP_COMMON/server/nats.cfg
  fi
}
