#!/bin/sh -e
#
# Copyright 2019 Canonical Ltd.  All rights reserved.
#

ARCH=
MACHINE_ARCH="$(uname -m)"
case "$MACHINE_ARCH" in
	x86_64)
		ARCH="amd64"
		;;
	aarch64)
		ARCH="arm64"
		;;
	*)
		echo "Machine architecture $MACHINE_ARCH is not supported"
		exit 1
esac

NATS_SERVER="$SNAP/bin/nats-server.$ARCH"
if [ -e "$SNAP_COMMON"/nats-server.debug ]; then
    NATS_SERVER="$SNAP_COMMON"/nats-server.debug
fi

exec "$NATS_SERVER" -c "$SNAP_COMMON"/server/nats.cfg
