#!/bin/sh

export $(dbus-launch)
exec /bin/spotifyd "$@"
