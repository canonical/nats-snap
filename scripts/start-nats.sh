#!/bin/sh -e
#
# Copyright 2019 Canonical Ltd.  All rights reserved.
#

if [ ! -e "$SNAP_COMMON"/server/nats.cfg ]; then
	echo "WARNING: No configuration, not starting"
	exit 0
fi

exec "$SNAP"/bin/nats-server -c "$SNAP_COMMON"/server/nats.cfg
