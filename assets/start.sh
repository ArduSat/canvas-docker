#!/bin/bash

set -e

/opt/canvas/setenv.sh

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
