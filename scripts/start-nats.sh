#!/bin/sh -e
#
# Copyright 2020 Canonical Ltd.  All rights reserved.
#

NATS_SERVER="$SNAP/bin/nats-server"
if [ -e "$SNAP_COMMON"/nats-server.debug ]; then
    NATS_SERVER="$SNAP_COMMON"/nats-server.debug
fi

exec "$NATS_SERVER" -c "$SNAP_COMMON"/server/nats.cfg
